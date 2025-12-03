local ffi = require "cffi"

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
        if (not activeOnly) or (stateFlags & 0x1 ~= 0) then
            local adapterName  = ffi.string(DISPLAY_DEVICE.DeviceName)
            local adapterLabel = ffi.string(DISPLAY_DEVICE.DeviceString)

            -- SECOND-LEVEL ENUM TO GET MONITOR NAME
            local MONITOR_DEVICE = ffi.new("DISPLAY_DEVICEA")
            MONITOR_DEVICE.cb = ffi.sizeof(MONITOR_DEVICE)

            local monitorName = "Unknown Monitor"
            if user32.EnumDisplayDevicesA(adapterName, 0, MONITOR_DEVICE, 0) ~= 0 then
                monitorName = ffi.string(MONITOR_DEVICE.DeviceString)
            end

            local monitor = {
                adapterName = adapterName,       -- GPU display output
                adapterLabel = adapterLabel,     -- GPU model name
                monitorName = monitorName,       -- Human readable monitor name (EDID)
                resolutions = {},
                stateFlags = stateFlags
            }

            -- ENUMERATE VALID RESOLUTIONS
            local seen = {}
            local modeIndex = 0
            local DEVMODE = ffi.new("DEVMODEA")
            DEVMODE.dmSize = ffi.sizeof(DEVMODE)

            while user32.EnumDisplaySettingsExA(adapterName, modeIndex, DEVMODE, EDS_ENUM_CURRENT_SETTINGS) ~= 0 do
                local w  = tonumber(DEVMODE.dmPelsWidth)
                local h  = tonumber(DEVMODE.dmPelsHeight)
                local hz = tonumber(DEVMODE.dmDisplayFrequency)

                if w > 0 and h > 0 then
                    local key = string.format("%dx%d@%d", w, h, hz)
                    if not seen[key] then
                        seen[key] = true
                        table.insert(monitor.resolutions, {width=w, height=h, refresh=hz})
                    end
                end

                modeIndex = modeIndex + 1
            end

            table.insert(result, monitor)
        end

        devIndex = devIndex + 1
    end

    return result
end

return monitors
