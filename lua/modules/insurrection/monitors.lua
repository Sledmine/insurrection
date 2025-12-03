local ffi = require "cffi"
local bit = require "bit"

ffi.cdef[[
typedef int BOOL;
typedef unsigned long DWORD;
typedef const char* LPCSTR;
typedef unsigned short WORD;
typedef long LONG;

typedef struct _DISPLAY_DEVICEA {
    DWORD cb;
    char  DeviceName[32];
    char  DeviceString[128];
    DWORD StateFlags;
    char  DeviceID[128];
    char  DeviceKey[128];
} DISPLAY_DEVICEA, *PDISPLAY_DEVICEA;

typedef struct _POINTL {
    LONG x;
    LONG y;
} POINTL;

typedef struct _devicemodeA {
    char  dmDeviceName[32];
    WORD  dmSpecVersion;
    WORD  dmDriverVersion;
    WORD  dmSize;
    WORD  dmDriverExtra;
    DWORD dmFields;

    union {
        struct {
            short dmOrientation;
            short dmPaperSize;
            short dmPaperLength;
            short dmPaperWidth;
            short dmScale;
            short dmCopies;
            short dmDefaultSource;
            short dmPrintQuality;
        } printer;
        struct {
            POINTL dmPosition;
            DWORD  dmDisplayOrientation;
            DWORD  dmDisplayFixedOutput;
        } display;
    } u1;

    short dmColor;
    short dmDuplex;
    short dmYResolution;
    short dmTTOption;
    short dmCollate;
    char  dmFormName[32];
    WORD  dmLogPixels;
    DWORD dmBitsPerPel;
    DWORD dmPelsWidth;
    DWORD dmPelsHeight;
    DWORD dmDisplayFlags;
    DWORD dmDisplayFrequency;
    DWORD dmICMMethod;
    DWORD dmICMIntent;
    DWORD dmMediaType;
    DWORD dmDitherType;
    DWORD dmReserved1;
    DWORD dmReserved2;
    DWORD dmPanningWidth;
    DWORD dmPanningHeight;

} DEVMODEA, *PDEVMODEA;

BOOL EnumDisplayDevicesA(LPCSTR lpDevice, DWORD iDevNum, PDISPLAY_DEVICEA lpDisplayDevice, DWORD dwFlags);
BOOL EnumDisplaySettingsExA(LPCSTR lpszDeviceName, DWORD iModeNum, PDEVMODEA lpDevMode, DWORD dwFlags);
]]

local user32 = ffi.load("user32")

local monitors = {}

local EDS_ENUM_CURRENT_SETTINGS = 0x00000001

local getFlags = function(stateFlags)
    return {
        DISPLAY_DEVICE_ACTIVE = bit.band(stateFlags, 0x1) ~= 0,
        DISPLAY_DEVICE_MIRRORING_DRIVER = bit.band(stateFlags, 0x8) ~= 0,
        DISPLAY_DEVICE_MODESPRUNED = bit.band(stateFlags, 0x8000000) ~= 0,
        DISPLAY_DEVICE_PRIMARY_DEVICE = bit.band(stateFlags, 0x4) ~= 0,
        DISPLAY_DEVICE_REMOVABLE = bit.band(stateFlags, 0x20) ~= 0,
        DISPLAY_DEVICE_VGA_COMPATIBLE = bit.band(stateFlags, 0x10) ~= 0,
    }
end

function monitors.getAll(activeOnly)
    local result = {}
    local DISPLAY_DEVICE = ffi.new("DISPLAY_DEVICEA")
    local devIndex = 0

    while true do
        DISPLAY_DEVICE.cb = ffi.sizeof(DISPLAY_DEVICE)
        if user32.EnumDisplayDevicesA(nil, devIndex, DISPLAY_DEVICE, 0) == 0 then
            break
        end

        local stateFlags = tonumber(DISPLAY_DEVICE.StateFlags)
        local flags = getFlags(stateFlags)

        if (not activeOnly) or flags.DISPLAY_DEVICE_ACTIVE then
            local adapterName  = ffi.string(DISPLAY_DEVICE.DeviceName)
            local adapterLabel = ffi.string(DISPLAY_DEVICE.DeviceString)

            -------------------------------------------------------
            -- SECOND-LEVEL ENUM TO GET REAL EDID MONITOR NAME
            -------------------------------------------------------
            local monitorName = "Unknown Monitor"
            local MONITOR_DEVICE = ffi.new("DISPLAY_DEVICEA")

            local subIndex = 0
            while true do
                MONITOR_DEVICE.cb = ffi.sizeof(MONITOR_DEVICE)

                if user32.EnumDisplayDevicesA(adapterName, subIndex, MONITOR_DEVICE, 0) == 0 then
                    break
                end

                local devId = ffi.string(MONITOR_DEVICE.DeviceID)
                local flags = getFlags(tonumber(MONITOR_DEVICE.StateFlags))
                --print(tonumber(MONITOR_DEVICE.StateFlags))
                --print(inspect(flags))

                -- Real hardware monitors show up as: MONITOR\ABC1234
                if devId:match("^MONITOR\\") and flags.DISPLAY_DEVICE_ACTIVE then
                    monitorName = ffi.string(MONITOR_DEVICE.DeviceString)
                    break
                end

                subIndex = subIndex + 1
            end

            local monitor = {
                adapterName   = adapterName,
                adapterLabel  = adapterLabel,
                monitorName   = monitorName,
                resolutions   = {},
                stateFlags    = stateFlags
            }

            -------------------------------------------------------
            -- ENUMERATE RESOLUTIONS
            -------------------------------------------------------
            local seen = {}
            local modeIndex = 0
            local DEVMODE = ffi.new("DEVMODEA")
            DEVMODE.dmSize = ffi.sizeof(DEVMODE)

            while user32.EnumDisplaySettingsExA(adapterName, modeIndex, DEVMODE, EDS_ENUM_CURRENT_SETTINGS) ~= 0 do
                local w  = tonumber(DEVMODE.dmPelsWidth)
                local h  = tonumber(DEVMODE.dmPelsHeight)
                local hz = tonumber(DEVMODE.dmDisplayFrequency)

                if w > 0 and h > 0 then
                    local key = ("%dx%d@%d"):format(w, h, hz)
                    if not seen[key] then
                        seen[key] = true
                        table.insert(monitor.resolutions, {
                            width  = w,
                            height = h,
                            refresh = hz
                        })
                    end
                end

                modeIndex = modeIndex + 1
            end

            table.insert(result, monitor)
        end

        devIndex = devIndex + 1
    end

    -- Destroy FFI objects to free memory
    DISPLAY_DEVICE = nil
    collectgarbage()

    return result
end

return monitors
