ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

TriggerEvent('es:addCommand', 'toggleui', function()
end, { help = _U('toggleui') })

RegisterServerEvent('trew_hud_ui:getServerInfo')
AddEventHandler('trew_hud_ui:getServerInfo', function()

	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local job

	if xPlayer ~= nil then
		if xPlayer.job.label == xPlayer.job.grade_label then
			job = xPlayer.job.grade_label
		elseif xPlayer.job2.label == xPlayer.job2.grade_label then --TrewUi DoubleJob2 by ademo !
			job2 = xPlayer.job2.grade_label --TrewUi DoubleJob2 by ademo !

		else
			job = xPlayer.job.label .. ': ' .. xPlayer.job.grade_label
			job2 = xPlayer.job2.label .. ': ' .. xPlayer.job2.grade_label --TrewUi DoubleJob2 by ademo !
		end

		local info = {
			job = job,
			job2 = job2, --TrewUi DoubleJob2 by ademo !
			money = xPlayer.getMoney(),
			bankMoney = xPlayer.getBank(),
			blackMoney = xPlayer.getAccount('black_money').money
		}

		TriggerClientEvent('trew_hud_ui:setInfo', source, info)
	end
end)

RegisterServerEvent('trew_hud_ui:syncCarLights')
AddEventHandler('trew_hud_ui:syncCarLights', function(status)
	TriggerClientEvent('trew_hud_ui:syncCarLights', -1, source, status)
end)