local constants = require('overseer.constants')
local util = require('overseer.util')
local STATUS = constants.STATUS

local function get_level_from_status(status)
	if status == STATUS.FAILURE then
		return "ERROR"
	elseif status == STATUS.CANCELED then
		return "WARN"
	else
		return "INFO"
	end
end

return {
	desc = "notify with notify plugin when task is complete",
	params = {
		statuses = {
			desc = "List of statuses to notify on",
			type = "list",
			subtype = {
				type = "enum",
				choices = STATUS.values,
			},
			default = {
				STATUS.FAILURE,
				STATUS.SUCCESS,
			},
		},
		on_change = {
			desc = "Only notify when task status changes from previous value",
			type = "boolean",
			default = false,
		},
	},
	constructor = function(params)
		if type(params.statuses) == "string" then
			params.statuses = { params.statuses }
		end

		local lookup = util.list_to_map(params.statuses)

		return {
			last_status = nil,
			on_complete = function(self, task, status)
				if lookup[status] then
					if params.on_change then
						if status == self.last_status then
							return
						end
						self.last_status = status
					end
					local level = get_level_from_status(status)
					local message = string.format("%s %s", status, task.name)
					require('notify').notify({message}, level)
				end
			end
		}
	end
}
