local rotation = {}

local sqrt = math.sqrt
local sin = math.sin
local cos = math.cos
local fmod = math.fmod
local rad = math.rad
local deg = math.deg
local atan = math.atan
local pi = math.pi
local atan2 = function(y, x)
    return atan(y / x) + (x < 0 and pi or 0)
end

---@class EulerAngles
---@field yaw number
---@field pitch number
---@field roll number

---Returns game rotation vectors from euler angles, return optional rotation matrix, based on
---[mecademic docs.](https://www.mecademic.com/en/how-is-orientation-in-space-represented-with-euler-angles)
--- @param yaw number
--- @param pitch number
--- @param roll number
--- @return Vector3d forwardVector, Vector3d upVector
function rotation.eulerToRotationVectors(yaw, pitch, roll)
    local yawRad = rad(yaw)
    local pitchRad = rad(-pitch)
    local rollRad = rad(roll)

    local cosA = cos(rollRad)
    local sinA = sin(rollRad)
    local cosB = cos(pitchRad)
    local sinB = sin(pitchRad)
    local cosY = cos(yawRad)
    local sinY = sin(yawRad)

    local m11 = cosB * cosY
    local m13 = sinB
    local m21 = cosA * sinY + sinA * sinB * cosY
    local m23 = -sinA * cosB
    local m31 = sinA * sinY - cosA * sinB * cosY
    local m33 = cosA * cosB

    -- Match blam.rotateObject: v1 is first matrix column, v2 is third matrix column.
    local forwardVector = {i = m11, j = m21, k = m31}
    local upVector = {i = m13, j = m23, k = m33}
    return forwardVector, upVector
end

--- Get euler angles rotation from game rotation vectors
--- @param v1 Vector3d Vector with first column values from rotation matrix
--- @param v2 Vector3d Vector with third column values from rotation matrix
--- @return number yaw, number pitch, number roll
function rotation.vectorsToEulerAngles(v1, v2)
    -- Match eulerToRotationVectors: v1 is the first matrix column (forward),
    -- v2 is the third matrix column (up), and the second column is their cross product.
    local v3 = {
        i = v1.j * v2.k - v1.k * v2.j,
        j = v1.k * v2.i - v1.i * v2.k,
        k = v1.i * v2.j - v1.j * v2.i
    }

    local matrix = {{v1.i, v3.i, v2.i}, {v1.j, v3.j, v2.j}, {v1.k, v3.k, v2.k}}

    -- Extract individual matrix elements
    local m11, m12, m13 = matrix[1][1], matrix[1][2], matrix[1][3]
    local m21, m22, m23 = matrix[2][1], matrix[2][2], matrix[2][3]
    local m31, m32, m33 = matrix[3][1], matrix[3][2], matrix[3][3]

    -- Calculate yaw (heading) angle
    local yaw = atan2(m12, m11)

    -- Calculate pitch (attitude) angle
    local pitch = atan2(-m13, sqrt(m23 ^ 2 + m33 ^ 2))

    -- Calculate roll (bank) angle
    local roll = -atan2(m23, m33)

    -- Convert angles from radians to degrees
    yaw = deg(yaw)
    pitch = deg(pitch)
    roll = deg(roll)

    -- Adjust angles to the range [0, 359]
    yaw = fmod(yaw + 360, 360)
    pitch = fmod(pitch + 360, 360)
    roll = fmod(roll + 360, 360)

    return yaw, pitch, roll
end

return rotation
