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
BOOL EnumDisplaySettingsA(LPCSTR lpszDeviceName, DWORD iModeNum, PDEVMODEA lpDevMode);

]]

local user32 = ffi.load("user32")

local monitors = {}

-- Fetch all monitors with their resolutions
function monitors.getAll(activeOnly)
    local result = {}
    local DISPLAY_DEVICE = ffi.new("DISPLAY_DEVICEA")
    local DEVMODE = ffi.new("DEVMODEA")
    DISPLAY_DEVICE.cb = ffi.sizeof(DISPLAY_DEVICE)
    DEVMODE.dmSize = ffi.sizeof(DEVMODE)

    local devIndex = 0
    while user32.EnumDisplayDevicesA(nil, devIndex, DISPLAY_DEVICE, 0) ~= 0 do
        local stateFlags = tonumber(DISPLAY_DEVICE.StateFlags)
        if (not activeOnly) or (activeOnly and (stateFlags & 0x1) ~= 0) then -- DISPLAY_DEVICE_ACTIVE = 0x1
            local name = ffi.string(DISPLAY_DEVICE.DeviceName)
            local label = ffi.string(DISPLAY_DEVICE.DeviceString)

            local monitor = {
                name = name,
                label = label,
                resolutions = {},
                stateFlags = stateFlags
            }

            local seen = {}
            local modeIndex = 0
            while user32.EnumDisplaySettingsA(name, modeIndex, DEVMODE) ~= 0 do
                local w = tonumber(DEVMODE.dmPelsWidth)
                local h = tonumber(DEVMODE.dmPelsHeight)
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
