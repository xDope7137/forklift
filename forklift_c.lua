
--------------------------------------------------------
local Keys = {
    ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57, 
    ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177, 
    ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
    ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
    ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
    ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70, 
    ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
    ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
    ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }
  
  function DrawText3D(x, y, z, text)
      local onScreen,_x,_y=World3dToScreen2d(x, y, z)
      local px,py,pz=table.unpack(GetGameplayCamCoords())
      SetTextScale(0.37, 0.37)
      SetTextFont(4)
      SetTextProportional(1)
      SetTextColour(255, 255, 255, 215)
      SetTextEntry("STRING")
      SetTextCentre(1)
      AddTextComponentString(text)
      DrawText(_x,_y)
      local factor = (string.len(text)) / 370
      DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 33, 33, 33, 133)
  end
  
  local Anulowano = false
  local ZrespTuPojazd = {x = 221.45880126953, y = -2967.1662597656, z = 5.8969}
  local rampaCoord = {x = 138.2465057373, y = -3089.1518554688, z = 5.89631}
  local wezCar = {x = 145.67060852051, y = -3108.6743164063, z = 5.896}
  local zlecenieDist = {x = 152.32009887695, y = -3101.5874023438, z = 5.8963}
  local zrespione = false
  local silnikOn = false
  local rodzajPojazdu = nil
  local naklejkaAuto = 0
  
  local kartonKoord1 = {x = 161.97207641602, y = -3142.4104003906, z = 5.959}
  local kartonKoord2 = {x = 161.18479919434, y = -3041.7497558594, z = 5.974014}
  local kartonKoord3 = {x = 166.7626953125, y = -3258.3393554688, z = 5.86072}
  local kartonKoord4 = {x = 116.09323120117, y = -3164.1032714844, z = 6.0136}
  local kartonKoord5 = {x = 117.36480712891, y = -2989.3310546875, z = 6.020}
  local czasikDostaw = 0
  local dostawaTimer = false
  local PrzejetyHangar = 0
  local premia1 = 50
  local premia2 = 35
  local premia3 = 25
  -----------------------garaz2
  local ZrespTuPojazd2 = {x = 275.67260742188, y = -3166.150390625, z = 5.7902}
  local rampaCoord2 = {x = 158.15670776367, y = -3196.2829589844, z = 6.021}
  local wezCar2 = {x = 146.82814025879, y = -3210.5979003906, z = 5.8575}
  local zlecenieDist2 = {x = 152.90745544434, y = -3211.7609863281, z = 5.901}
  local pilot
  
  function ZrespPaczuszke(a)
      czasikDostaw=0
      dostawaTimer=true
      if a=='deski'then 
          paczuszka=CreateObject(GetHashKey('prop_boxpile_06a'),kartonKoord1.x,kartonKoord1.y,kartonKoord1.z-0.95,true,true,true)
          SetEntityAsMissionEntity(paczuszka)
          SetEntityDynamic(paczuszka,true)
          FreezeEntityPosition(paczuszka,false)
          SetNewWaypoint(kartonKoord1.x,kartonKoord1.y)
      elseif a=='lody'then 
          paczuszka=CreateObject(GetHashKey('prop_boxpile_02b'),kartonKoord2.x,kartonKoord2.y,kartonKoord2.z-0.95,true,true,true)
          SetEntityAsMissionEntity(paczuszka)
          SetEntityDynamic(paczuszka,true)
          FreezeEntityPosition(paczuszka,false)
          SetNewWaypoint(kartonKoord2.x,kartonKoord2.y)
      elseif a=='leki'then 
          paczuszka=CreateObject(GetHashKey('prop_boxpile_06a'),kartonKoord3.x,kartonKoord3.y,kartonKoord3.z-0.95,true,true,true)
          SetEntityAsMissionEntity(paczuszka)
          SetEntityDynamic(paczuszka,true)
          FreezeEntityPosition(paczuszka,false)
          SetNewWaypoint(kartonKoord3.x,kartonKoord3.y)
      elseif a=='napoje'then 
          paczuszka=CreateObject(GetHashKey('prop_boxpile_09a'),kartonKoord4.x,kartonKoord4.y,kartonKoord4.z-0.95,true,true,true)
          SetEntityAsMissionEntity(paczuszka)
          SetEntityDynamic(paczuszka,true)
          FreezeEntityPosition(paczuszka,false)
          SetNewWaypoint(kartonKoord4.x,kartonKoord4.y)
      elseif a=='kawa'then 
          paczuszka=CreateObject(GetHashKey('prop_boxpile_06a'),kartonKoord5.x,kartonKoord5.y,kartonKoord5.z-0.95,true,true,true)
          SetEntityAsMissionEntity(paczuszka)
          SetEntityDynamic(paczuszka,true)
          FreezeEntityPosition(paczuszka,false)
          SetNewWaypoint(kartonKoord5.x,kartonKoord5.y)
      end 
  end
  
  
  RegisterNetEvent('tostdostawa:rampanpcdawaj')
  AddEventHandler('tostdostawa:rampanpcdawaj',function(a)
      Anulowano=false
      if a=='1'then
          if zrespione==true then
              TriggerEvent(Notify,'Complete the previous order!')
              return
          end
          local b=math.random(1,5)
          if b==1 then
              naklejkaAuto=3
              TriggerEvent(Notify,'The driver awaits loading the boards.')
              ZrespPaczuszke('deski')
          elseif b==2 then
              naklejkaAuto=4
              TriggerEvent(Notify,'The driver is waiting for the fish to be loaded.')
              ZrespPaczuszke('lody')
          elseif b==3 then
              naklejkaAuto=6
              TriggerEvent(Notify,'The driver is waiting for the medicine to be loaded.')
              ZrespPaczuszke('leki')
          elseif b==4 then
              naklejkaAuto=2
              TriggerEvent(Notify,'The driver awaits loading Logger Light drinks.')
              ZrespPaczuszke('napoje')
          elseif b==5 then
              naklejkaAuto=1
              TriggerEvent(Notify,'The driver awaits loading the coffee.')
              ZrespPaczuszke('kawa')
          end
          RequestModel(GetHashKey('benson'))
          while not HasModelLoaded(GetHashKey('benson'))do
              Citizen.Wait(0)end
          ClearAreaOfVehicles(ZrespTuPojazd.x,ZrespTuPojazd.y,ZrespTuPojazd.z,15.0,false,false,false,false,false)
          transport=CreateVehicle(GetHashKey('benson'),ZrespTuPojazd.x,ZrespTuPojazd.y,ZrespTuPojazd.z,-2.436,996.786,25.1887,true,true)
          SetEntityAsMissionEntity(transport)
          SetEntityHeading(transport,52.00)
          SetVehicleDoorsLocked(transport,2)
          SetVehicleDoorsLockedForAllPlayers(transport,true)
          SetVehicleExtra(transport,1,true)
          SetVehicleExtra(transport,2,true)
          SetVehicleExtra(transport,3,true)
          SetVehicleExtra(transport,4,true)
          SetVehicleExtra(transport,5,true)
          SetVehicleExtra(transport,6,true)
          SetVehicleExtra(transport,7,true)
          SetVehicleExtra(transport,naklejkaAuto,false)
          RequestModel("s_m_m_security_01")
          while not HasModelLoaded("s_m_m_security_01")do
              Wait(10)end
          pilot=CreatePedInsideVehicle(transport,1,"s_m_m_security_01",-1,true,true)
          SetBlockingOfNonTemporaryEvents(pilot,true)
          SetEntityInvincible(pilot,true)
          TaskVehiclePark(pilot,transport,rampaCoord.x,rampaCoord.y,rampaCoord.z,266.0,1,1.0,false)
          SetDriveTaskDrivingStyle(pilot,263100)
          SetPedKeepTask(pilot,true)
          TriggerEvent(Notify,'The driver is on his way.')
          zrespione=true
          silnikOn=true
          Citizen.Wait(900)
          while silnikOn do
              Citizen.Wait(1000)
              local c=GetIsVehicleEngineRunning(transport)
              if c==1 then
                  Citizen.Wait(200)
              else
                  silnikOn=false
              end
          end
          TriggerEvent(Notify,'The driver stopped and opened the trunk')
          SetVehicleDoorOpen(transport,5,false,false)
          backOpened=true
          local d,e,f=table.unpack(GetOffsetFromEntityInWorldCoords(transport,0.0,-6.0,-1.0))
          while backOpened do
              Citizen.Wait(2)
              DrawMarker(1,d,e,f,0,0,0,0,0,0,1.7,1.7,1.7,135,31,35,150,1,0,0,0)
              local g=GetEntityCoords(paczuszka)
              local h=Vdist(d,e,f,g.x,g.y,g.z)
              if h<=2.0 then
                  SetVehicleDoorShut(transport,5,false)
                  DeleteEntity(paczuszka)backOpened=false
              end
          end
          if Anulowano==true then
              return
          end
          TriggerEvent(Notify,'Package loaded, driver wraps up.')
          TriggerEvent(Notify,'You have loaded the package in '..czasikDostaw..' seconds.')
          if czasikDostaw<41 then
              TriggerEvent(Notify,'Bonus '..premia1 ..'$ for fast delivery')
              TriggerServerEvent("tostdostawa:wykonanieMisji",premia1)
              Citizen.Wait(200)
          elseif czasikDostaw>=41 and czasikDostaw<=55 then
              TriggerEvent(Notify,'Bonus '..premia2 ..'$ for fast delivery')
              TriggerServerEvent("tostdostawa:wykonanieMisji",premia2)
              Citizen.Wait(200)
          elseif czasikDostaw>=56 and czasikDostaw<=65 then
              TriggerEvent(Notify,'Bonus '..premia3 ..'$ for fast delivery')
              TriggerServerEvent("tostdostawa:wykonanieMisji",premia3)
              Citizen.Wait(200)
          elseif czasikDostaw>65 then
              TriggerEvent(Notify,'No bonus for quick delivery')
          end
          czasikDostaw=0
          dostawaTimer=false
          TriggerServerEvent("tostdostawa:wykonanieMisji",'nie')
          TaskVehicleDriveWander(pilot,transport,50.0,263100)
          Citizen.Wait(15000)
          DeleteEntity(transport)
          DeleteEntity(pilot)zrespione=0
          TriggerEvent(Notify,'You can accept the next order')
      elseif a=='2'then
          if zrespione==true then
              TriggerEvent(Notify,'Complete the previous order!')
              return
          end
          local b=math.random(1,5)
          if b==1 then
              naklejkaAuto=3
              TriggerEvent(Notify,'The driver awaits loading the boards.')
              ZrespPaczuszke('deski')
          elseif b==2 then
              naklejkaAuto=4
              TriggerEvent(Notify,'The driver is waiting for the fish to be loaded.')
              ZrespPaczuszke('lody')
          elseif b==3 then
              naklejkaAuto=6
              TriggerEvent(Notify,'The driver is awaiting loading of medications.')
              ZrespPaczuszke('leki')
          elseif b==4 then
              naklejkaAuto=2
              TriggerEvent(Notify,'The driver awaits loading Logger Light drinks.')
              ZrespPaczuszke('napoje')
          elseif b==5 then
              naklejkaAuto=1
              TriggerEvent(Notify,'The driver awaits loading the coffee.')
              ZrespPaczuszke('kawa')
          end
          RequestModel(GetHashKey('benson'))
          while not HasModelLoaded(GetHashKey('benson'))do
              Citizen.Wait(0)
          end
          ClearAreaOfVehicles(ZrespTuPojazd.x,ZrespTuPojazd.y,ZrespTuPojazd.z,15.0,false,false,false,false,false)
          transport=CreateVehicle(GetHashKey('benson'),ZrespTuPojazd2.x,ZrespTuPojazd2.y,ZrespTuPojazd2.z,-2.436,996.786,25.1887,true,true)
          SetEntityAsMissionEntity(transport)
          SetEntityHeading(transport,52.00)
          SetVehicleDoorsLocked(transport,2)
          SetVehicleDoorsLockedForAllPlayers(transport,true)
          SetVehicleExtra(transport,1,true)
          SetVehicleExtra(transport,2,true)
          SetVehicleExtra(transport,3,true)
          SetVehicleExtra(transport,4,true)
          SetVehicleExtra(transport,5,true)
          SetVehicleExtra(transport,6,true)
          SetVehicleExtra(transport,7,true)
          SetVehicleExtra(transport,naklejkaAuto,false)
          RequestModel("s_m_m_security_01")
          while not HasModelLoaded("s_m_m_security_01")do
              Wait(10)
          end
          pilot=CreatePedInsideVehicle(transport,1,"s_m_m_security_01",-1,true,true)
          SetBlockingOfNonTemporaryEvents(pilot,true)
          SetEntityInvincible(pilot,true)
          TaskVehiclePark(pilot,transport,rampaCoord2.x,rampaCoord2.y,rampaCoord2.z,266.0,1,1.0,false)
          SetDriveTaskDrivingStyle(pilot,263100)
          SetPedKeepTask(pilot,true)
          TriggerEvent(Notify,'The driver is on his way.')
          zrespione=true
          silnikOn=true
          Citizen.Wait(900)
          while silnikOn do
              Citizen.Wait(1000)
              local c=GetIsVehicleEngineRunning(transport)
              if c==1 then
                  Citizen.Wait(200)
              else
                  silnikOn=false
              end
          end
          TriggerEvent(Notify,'The driver stopped and opened the trunk')
          SetVehicleDoorOpen(transport,5,false,false)
          backOpened=true
          local d,e,f=table.unpack(GetOffsetFromEntityInWorldCoords(transport,0.0,-6.0,-1.0))
          while backOpened do
              Citizen.Wait(2)
              DrawMarker(1,d,e,f,0,0,0,0,0,0,1.7,1.7,1.7,135,31,35,150,1,0,0,0)
              local g=GetEntityCoords(paczuszka)
              local h=Vdist(d,e,f,g.x,g.y,g.z)
              if h<=2.0 then
                  SetVehicleDoorShut(transport,5,false)
                  DeleteEntity(paczuszka)backOpened=false
              end
          end
          if Anulowano==true then
              return
          end
          TriggerEvent(Notify,'Package loaded, driver wraps up.')
          TriggerEvent(Notify,'You have loaded the package in '..czasikDostaw..' seconds.')
          if czasikDostaw<61 then
              TriggerEvent(Notify,'Bonus '..premia1 ..'$ for fast delivery')
              TriggerServerEvent("tostdostawa:wykonanieMisji",premia1)
              Citizen.Wait(200)
          elseif czasikDostaw>=61 and czasikDostaw<=75 then
              TriggerEvent(Notify,'Bonus '..premia2 ..'$ for fast delivery')
              TriggerServerEvent("tostdostawa:wykonanieMisji",premia2)
              Citizen.Wait(200)
          elseif
              czasikDostaw>=76 and czasikDostaw<=85 then
              TriggerEvent(Notify,'Bonus '..premia3 ..'$ for fast delivery')
              TriggerServerEvent("tostdostawa:wykonanieMisji",premia3)
              Citizen.Wait(200)
          elseif
              czasikDostaw>85
          then
              TriggerEvent(Notify,'No bonus for quick delivery')
          end
          czasikDostaw=0
          dostawaTimer=false
          TriggerServerEvent("tostdostawa:wykonanieMisji",'nie')
          TaskVehicleDriveWander(pilot,transport,50.0,263100)
          Citizen.Wait(15000)
          DeleteEntity(transport)
          DeleteEntity(pilot)zrespione=0
          TriggerEvent(Notify,'You can accept the next order')
      end
  end)
  
  
  
  
  
  Citizen.CreateThread(function()
      while true do
          Citizen.Wait(1000)
          
          if dostawaTimer == true then
          czasikDostaw = czasikDostaw +1
              if czasikDostaw > 140 then
              Anulowano = true
              zrespione = 0
              czasikDostaw = 0
              dostawaTimer = false
              backOpened = false
              silnikOn = false
              DeleteEntity(transport)
              DeleteEntity(pilot)
              DeleteEntity(paczuszka)
              TriggerEvent(Notify,'The order was canceled because you took too long loading')
              end
          else
          Citizen.Wait(2000)
          end	
          
  end
  end)
          
  Citizen.CreateThread(function()
      while true do
          Citizen.Wait(4)
          
          if DoesEntityExist(paczuszka) then
          local paczkCoord = GetEntityCoords(paczuszka)
          DrawMarker(0, paczkCoord.x, paczkCoord.y, paczkCoord.z+2.1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 135, 31, 35, 150, 1, 0, 0, 0)
          else
          Citizen.Wait(2500)
          end
  end
  end)
  
  
  
  RegisterNetEvent('tostdostawa:maszHangar')
  AddEventHandler('tostdostawa:maszHangar', function()
  PrzejetyHangar = 1
  end)
  
  Citizen.CreateThread(function()
      while true do
          Citizen.Wait(3)
          
              local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
              local distCar = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, wezCar.x, wezCar.y, wezCar.z)
              local zlecDist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, zlecenieDist.x, zlecenieDist.y, zlecenieDist.z)
              
              if distCar <= 25.0 or zlecDist <= 25.0 then
              DrawMarker(27, wezCar.x, wezCar.y, wezCar.z-0.90, 0, 0, 0, 0, 0, 0, 1.301, 1.3001, 1.3001, 255, 255, 255, 200, 0, 0, 0, 0)
              DrawMarker(27, zlecenieDist.x, zlecenieDist.y, zlecenieDist.z-0.90, 0, 0, 0, 0, 0, 0, 1.301, 1.3001, 1.3001, 255, 255, 255, 200, 0, 0, 0, 0)
              else
              Citizen.Wait(1500)
              end
              
              if distCar <= 1.0 then
                  DrawText3D(wezCar.x, wezCar.y, wezCar.z, "[E] To take a forklift")
                  if IsControlJustPressed(0, Keys['E']) then 
                  PozyczPojazd('1')
                  end
              end
              
              if zlecDist <= 1.0 then
                  DrawText3D(zlecenieDist.x, zlecenieDist.y, zlecenieDist.z, "[E] Take order")
                  DrawText3D(zlecenieDist.x, zlecenieDist.y, zlecenieDist.z-0.13, "[G] Take over the hangar")
                  if IsControlJustPressed(0, Keys['E']) then 
                      if PrzejetyHangar == 1 then
                      TriggerEvent('tostdostawa:rampanpcdawaj','1')
                      TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_CLIPBOARD", 0, false)
                      Citizen.Wait(2000)
                      ClearPedTasks(GetPlayerPed(-1))
                      TriggerEvent(Notify,'The package to be delivered is marked on the GPS, use a forklift.')
                      else
                      TriggerEvent(Notify,'You must take over the hangar')
                      end
                  elseif IsControlJustPressed(0, Keys['G']) then
                      if PrzejetyHangar == 1 then
                      TriggerEvent(Notify,'You already have a hangar')
                      else
                      TriggerServerEvent("tostdostawa:przejmijHangar", '1')
                      Citizen.Wait(500)
                      end
                  end
              end
  
  end
  end)
  ----garaz 2
  Citizen.CreateThread(function()
      while true do
          Citizen.Wait(3)
          
              local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
              local distCar2 = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, wezCar2.x, wezCar2.y, wezCar2.z)
              local zlecDist2 = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, zlecenieDist2.x, zlecenieDist2.y, zlecenieDist2.z)
              
              if distCar2 <= 25.0 or zlecDist2 <= 25.0 then
              DrawMarker(27, wezCar2.x, wezCar2.y, wezCar2.z-0.90, 0, 0, 0, 0, 0, 0, 1.301, 1.3001, 1.3001, 255, 255, 255, 200, 0, 0, 0, 0)
              DrawMarker(27, zlecenieDist2.x, zlecenieDist2.y, zlecenieDist2.z-0.90, 0, 0, 0, 0, 0, 0, 1.301, 1.3001, 1.3001, 255, 255, 255, 200, 0, 0, 0, 0)
              else
              Citizen.Wait(1500)
              end
              
              if distCar2 <= 1.0 then
                  DrawText3D(wezCar2.x, wezCar2.y, wezCar2.z, "[E] To take a forklift")
                  if IsControlJustPressed(0, Keys['E']) then 
                  PozyczPojazd('2')
                  end
              end
              
              if zlecDist2 <= 1.0 then
                  DrawText3D(zlecenieDist2.x, zlecenieDist2.y, zlecenieDist2.z, "[E] Take order")
                  DrawText3D(zlecenieDist2.x, zlecenieDist2.y, zlecenieDist2.z-0.13, "[G] Take over the hangar")
                  if IsControlJustPressed(0, Keys['E']) then 
                      if PrzejetyHangar == 1 then
                      TriggerEvent('tostdostawa:rampanpcdawaj','2')
                      TaskStartScenarioInPlace(GetPlayerPed(-1), "WORLD_HUMAN_CLIPBOARD", 0, false)
                      Citizen.Wait(2000)
                      ClearPedTasks(GetPlayerPed(-1))
                      TriggerEvent(Notify,'The package to be delivered is marked on the GPS, use a forklift.')
                      else
                      TriggerEvent(Notify,'You must take over the hangar')
                      end
                  elseif IsControlJustPressed(0, Keys['G']) then
                      if PrzejetyHangar == 1 then
                      TriggerEvent(Notify,'You already have a hangar')
                      else
                      TriggerServerEvent("tostdostawa:przejmijHangar", '2')
                      Citizen.Wait(500)
                      end
                  end
              end
  
  end
  end)
  
  local PojazdWyjety = 0
  local wozek
  
  function PozyczPojazd(a)
      if a=='1'then
          if PojazdWyjety==0 then
              RequestModel(GetHashKey('forklift'))
              while not HasModelLoaded(GetHashKey('forklift'))do
                  Citizen.Wait(0)
              end
              ClearAreaOfVehicles(wezCar.x,wezCar.y,wezCar.z,15.0,false,false,false,false,false)
              wozek=CreateVehicle(GetHashKey('forklift'),wezCar.x,wezCar.y,wezCar.z,-2.436,996.786,25.1887,true,true)
              SetEntityHeading(wozek,52.00)
              TaskWarpPedIntoVehicle(GetPlayerPed(-1),wozek,-1)
              SetVehicleColours(wozek,111,111)PojazdWyjety=1
              TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(wozek))
          else
              PojazdWyjety=0
              DeleteEntity(wozek)TriggerEvent(Notify,'Your previous vehicle has been deleted, you can retreive a new one')
          end
      elseif a=='2'then
          if PojazdWyjety==0 then
              RequestModel(GetHashKey('forklift'))
              while not HasModelLoaded(GetHashKey('forklift'))do
                  Citizen.Wait(0)end
              ClearAreaOfVehicles(wezCar2.x,wezCar2.y,wezCar2.z,15.0,false,false,false,false,false)
              wozek=CreateVehicle(GetHashKey('forklift'),wezCar2.x,wezCar2.y,wezCar2.z,-2.436,996.786,25.1887,true,true)
              SetEntityHeading(wozek,52.00)
              TaskWarpPedIntoVehicle(GetPlayerPed(-1),wozek,-1)
              SetVehicleColours(wozek,111,111)PojazdWyjety=1
              TriggerEvent("vehiclekeys:client:SetOwner", GetVehicleNumberPlateText(wozek))
          else
              PojazdWyjety=0
              DeleteEntity(wozek)TriggerEvent(Notify,'Your previous vehicle has been deleted, you can retreive a new one')
          end
      end
  end
  
  ----
  
  Citizen.CreateThread(function()
      while true do 
          Citizen.Wait(1500)
          local a=GetEntityCoords(GetPlayerPed(-1),false)
          local b=Vdist(a.x,a.y,a.z,zlecenieDist2.x,zlecenieDist2.y,zlecenieDist2.z)
          local c=Vdist(a.x,a.y,a.z,zlecenieDist.x,zlecenieDist.y,zlecenieDist.z)
          if PrzejetyHangar==1 then 
              if b>205.0 then 
                  TriggerEvent(Notify,'Too far away from the warehouse because you lost the owner.')
                  TriggerServerEvent("tostdostawa:OdszedlDalekoo")
                  Citizen.Wait(1500)
              else 
                  Citizen.Wait(3500)
              end
              if c>205.0 then 
                  TriggerEvent(Notify,'Too far away from the warehouse because you lost the owner.')
                  TriggerServerEvent("tostdostawa:OdszedlDalekoo")
                  Citizen.Wait(1500)
              else 
                  Citizen.Wait(3500)
              end 
          end 
      end 
  end)
  
  