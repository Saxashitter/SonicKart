return function(self, p)
	local angle = R_PointToAngle2(0, 0, p.cmd.forwardmove, -p.cmd.sidemove)

	angle = $+( p.cmd.angleturn << 16 )

	return angle
end