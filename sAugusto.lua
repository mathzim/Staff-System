local fly = false
local invisible = false
local holdingVeh = false


function getPlayerID(id)
  v = false
  for i, player in ipairs (getElementsByType("player")) do
    if getElementData(player, "ID") == id then
      v = player
      break
    end
  end
  return v
end

addCommandHandler(FLY, function(thePlayer, commandName)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if fly then
    triggerClientEvent(thePlayer, "onClientFlyToggle", thePlayer)
    infoboxAugusto(thePlayer, MSGFLYFALSE, "success")
    fly = false
  else
    triggerClientEvent(thePlayer, "onClientFlyToggle", thePlayer)
    infoboxAugusto(thePlayer, MSGFLYTRUE, "success")
    fly = true
  end
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(INVISIBLE, function(thePlayer, commandName)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if invisible then
    setElementAlpha(thePlayer, 255)
    infoboxAugusto(thePlayer, MSGINVISIBLEFALSE, "success")
    invisible = false
  else
    setElementAlpha(thePlayer, 0)
    infoboxAugusto(thePlayer, MSGINVISIBLETRUE, "success")
    invisible = true
  end
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(SETSKIN, function(thePlayer, commandName, id, skin)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if not tonumber(id) then infoboxAugusto(thePlayer, ERRORID, "error") return end
  if not tonumber(skin) then infoboxAugusto(thePlayer, ERRORSKINID, "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then infoboxAugusto(thePlayer, ERRORPLAYER, "error") return end
  setElementModel(targetPlayer, skin)
  infoboxAugusto(targetPlayer, "O Staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."] Alterou sua skin para o ID "..skin, "success")
  infoboxAugusto(thePlayer, "Voce alterou da skin do player "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."] para o ID "..skin, "success")
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(LIFE, function(thePlayer, commandName, id, life)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if not tonumber(id) then infoboxAugusto(thePlayer, ERRORID, "error") return end
  if not tonumber(life) then infoboxAugusto(thePlayer, ERRORLIFE, "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then infoboxAugusto(thePlayer, ERRORPLAYER, "error") return end
  setElementHealth(targetPlayer, life)
  infoboxAugusto(targetPlayer, "O Staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."] Alterou sua vida para o valor "..life, "success")
  infoboxAugusto(thePlayer, "Voce alterou da vida do player "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."] para o valor "..life, "success")
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(FIX, function(thePlayer, commandName, id)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if not tonumber(id) then infoboxAugusto(thePlayer, ERRORID, "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then infoboxAugusto(thePlayer, ERRORPLAYER, "error") return end
  if not getPedOccupiedVehicle(targetPlayer) then infoboxAugusto(thePlayer, ERRORNOVEHICLE, "error") return end
  local veh = getPedOccupiedVehicle(targetPlayer)
  fixVehicle(veh)
  infoboxAugusto(targetPlayer, "O Staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."] Consertou seu veiculo", "success")
  infoboxAugusto(thePlayer, "Voce consertou o veiculo do player "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."]", "success")
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(DESTROYVEHICLE, function(thePlayer, commandName, id)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if not tonumber(id) then infoboxAugusto(thePlayer, ERRORID, "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then infoboxAugusto(thePlayer, ERRORPLAYER, "error") return end
  if not getPedOccupiedVehicle(targetPlayer) then infoboxAugusto(thePlayer, ERRORNOVEHICLE, "error") return end
  local veh = getPedOccupiedVehicle(targetPlayer)
  destroyElement(veh)
  infoboxAugusto(targetPlayer, "O Staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."] Destruiu seu veiculo", "success")
  infoboxAugusto(thePlayer, "Voce destruiu o veiculo do player "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."]", "success")
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(ARMOR, function(thePlayer, commandName, id, armor)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if not tonumber(id) then infoboxAugusto(thePlayer, ERRORID, "error") return end
  if not tonumber(armor) then infoboxAugusto(thePlayer, ERRORARMOR, "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then infoboxAugusto(thePlayer, ERRORPLAYER, "error") return end
  setPedArmor(targetPlayer, armor)
  infoboxAugusto(targetPlayer, "O Staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."] Alterou seu colete para o valor "..armor, "success")
  infoboxAugusto(thePlayer, "Voce alterou o colete do player "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."] para o valor "..armor, "success")
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(KICK, function(thePlayer, commandName, id, reason)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if not tonumber(id) then infoboxAugusto(thePlayer, ERRORID, "error") return end
  if not reason then infoboxAugusto(thePlayer, ERRORKICKREASON, "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then infoboxAugusto(thePlayer, ERRORPLAYER, "error") return end
  if targetPlayer == thePlayer then infoboxAugusto(thePlayer, ERRORAUTOKICK, "error") return end
  kickPlayer(targetPlayer, thePlayer, reason)
  infoboxAugusto(thePlayer, "Voce expulsou o jogador "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."]", "success")
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(BAN, function(thePlayer, commandName, id, reason, time)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if not tonumber(id) then infoboxAugusto(thePlayer, ERRORID, "error") return end
  if not reason then infoboxAugusto(thePlayer, ERRORBANREASON, "error") return end
  if not tonumber(time) then infoboxAugusto(thePlayer, ERRORBANTIME, "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then infoboxAugusto(thePlayer, ERRORPLAYER, "error") return end
  if targetPlayer == thePlayer then infoboxAugusto(thePlayer, ERRORAUTOKICK, "error") return end
  banPlayer(targetPlayer, false, false, true, thePlayer, reason, time)
  infoboxAugusto(thePlayer, "Voce baniu o jogador "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."] Por "..time.." Segundos", "success")
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(CREATEVEHICLE, function(thePlayer, commandName, id, vehid)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if not tonumber(id) then infoboxAugusto(thePlayer, ERRORID, "error") return end
  if not tonumber(vehid) then infoboxAugusto(thePlayer, ERRORIDVEH, "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then infoboxAugusto(thePlayer, ERRORPLAYER, "error") return end
  if getPedOccupiedVehicle(targetPlayer) then infoboxAugusto(thePlayer, ERRORVEHICLEEXISTS, "error") return end
  local veh = createVehicle(vehid, getElementPosition(targetPlayer))
  warpPedIntoVehicle(targetPlayer, veh)
  infoboxAugusto(targetPlayer, "Voce recebeu um veiculo do staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."]", "success")
  infoboxAugusto(thePlayer, "Voce deu um veiculo ao player "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."]", "success")
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(AVISAR, function(thePlayer, commandName, id, ...)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if not tonumber(id) then infoboxAugusto(thePlayer, ERRORID, "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then infoboxAugusto(thePlayer, ERRORPLAYER, "error") return end
  local message = table.concat({...}, " ")
  infoboxAugusto(targetPlayer, "O Staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."] Lhe deu um aviso: "..message, "success")
  infoboxAugusto(thePlayer, "Voce deu um aviso ao player "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."]", "success")
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(RENAME, function(thePlayer, commandName, id, newNick)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if not tonumber(id) then infoboxAugusto(thePlayer, ERRORID, "error") return end
  if not newNick then infoboxAugusto(thePlayer, ERRORNICK, "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then infoboxAugusto(thePlayer, ERRORPLAYER, "error") return end
  setPlayerName(targetPlayer, newNick)
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(TP, function(thePlayer, commandName, id)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if not tonumber(id) then infoboxAugusto(thePlayer, ERRORID, "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then infoboxAugusto(thePlayer, ERRORPLAYER, "error") return end
  local x, y, z = getElementPosition(targetPlayer)
  local interior = getElementInterior(targetPlayer)
  local dimension = getElementDimension(targetPlayer)
  local r = getPedRotation(targetPlayer)
  setCameraInterior(thePlayer, interior)
  infoboxAugusto(targetPlayer, "O Staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."] Teleportou ate voce", "success")
  infoboxAugusto(thePlayer, "Voce teleportou ao player "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."]", "success")
  if getPedOccupiedVehicle(thePlayer) then
    local veh = getPedOccupiedVehicle(thePlayer)
    setVehicleTurnVelocity(veh, 0, 0, 0)
    setElementInterior(thePlayer, interior)
    setElementDimension(thePlayer, dimension)
    setElementInterior(veh, interior)
    setElementDimension(veh, dimension)
    setElementPosition(veh, x, y, z + 1)
    warpPedIntoVehicle ( thePlayer, veh )
    setTimer(setVehicleTurnVelocity, 50, 20, veh, 0, 0, 0)
  else
    setElementPosition(thePlayer, x, y, z+2)
    setElementInterior(thePlayer, interior)
    setElementDimension(thePlayer, dimension)
  end
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(PUXAR, function(thePlayer, commandName, id)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if not tonumber(id) then infoboxAugusto(thePlayer, ERRORID, "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then infoboxAugusto(thePlayer, ERRORPLAYER, "error") return end
  local x, y, z = getElementPosition(thePlayer)
  local interior = getElementInterior(thePlayer)
  local dimension = getElementDimension(thePlayer)
  local r = getPedRotation(thePlayer)
  setCameraInterior(targetPlayer, interior)
  if getPedOccupiedVehicle(targetPlayer) then
    local veh = getPedOccupiedVehicle(targetPlayer)
    setVehicleTurnVelocity(veh, 0, 0, 0)
    setElementPosition(veh, x, y, z + 2)
    setTimer(setVehicleTurnVelocity, 50, 10, veh, 0, 0, 0)
    setElementInterior(veh, interior)
    setElementDimension(veh, dimension)
  else
    setElementPosition(targetPlayer, x, y, z+2)
    setElementInterior(targetPlayer, interior)
    setElementDimension(targetPlayer, dimension)
  end
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(TAKEWEAPONS, function(thePlayer, commandName, id)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if not tonumber(id) then infoboxAugusto(thePlayer, ERRORID, "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then infoboxAugusto(thePlayer, ERRORPLAYER, "error") return end
  takeAllWeapons(targetPlayer)
  infoboxAugusto(targetPlayer, "O Staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."] Pegou todas suas armas", "success")
  infoboxAugusto(thePlayer, "Voce removeu as armas do jogador "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."]", "success")
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(GIVEWEAPON, function(thePlayer, commandName, id, weaponid, ammu)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  if not tonumber(id) then infoboxAugusto(thePlayer, ERRORID, "error") return end
  if not tonumber(weaponid) then infoboxAugusto(thePlayer, ERRORWEAPONID, "error") return end
  if not tonumber(ammu) then infoboxAugusto(thePlayer, ERRORWEAPONAMMU, "error") return end
  local playerID = tonumber(id)
  local targetPlayer = getPlayerID(playerID)
  if not targetPlayer then infoboxAugusto(thePlayer, ERRORPLAYER, "error") return end
  giveWeapon(targetPlayer, weaponid, ammu)
  infoboxAugusto(targetPlayer, "O Staff "..getPlayerName(thePlayer).."["..(getElementData(thePlayer, "ID") or 0).."] Te deu a arma "..getWeaponNameFromID(weaponid).." Com "..ammu.." Munições", "success")
  infoboxAugusto(thePlayer, "Voce deu a arma "..getWeaponNameFromID(weaponid).." Com "..ammu.." Munições Para o jogador "..getPlayerName(targetPlayer).."["..(getElementData(targetPlayer, "ID") or 0).."]", "success")
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)

addCommandHandler(HOLDVEH, function(thePlayer, commandName)
if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(thePlayer)), aclGetGroup (ACL)) then
  for _, veh in ipairs(getElementsByType("vehicle")) do
    local x, y, z = getElementPosition(thePlayer)
    local x2, y2, z2 = getElementPosition(veh)
    if getDistanceBetweenPoints3D(x, y, z, x2, y2, z2) < DISTANCEHOLDVEH then
      if getVehicleOccupant(veh) then infoboxAugusto(thePlayer, ERRORVEHICLEHAVEPLAYER, "error") return end
      if holdingVeh then
        infoboxAugusto(thePlayer, MSGHOLDVEHFALSE, "success")
        detachElements(veh, thePlayer)
        setElementPosition(veh, x +2, y, z)
        holdingVeh = false
      else
        infoboxAugusto(thePlayer, MSGHOLDVEHTRUE, "success")
        attachElements(veh, thePlayer)
        setElementPosition(veh, x, y, z +5, true)
        holdingVeh = true
      end
    end
  end
else
  infoboxAugusto(thePlayer, ERRORPERMISSION, "error")
end
end)