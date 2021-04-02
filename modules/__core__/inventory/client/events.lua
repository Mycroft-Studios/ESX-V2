M("events")

onServer("esx:inventory:loaded", function(inventory)
  module.Init()
end)

onServer("esx:inventory:update", function(inventory)
  module.UpdateInventory(inventory)
end)

onServer("esx:inventory:weapontoggle", function(Weapon)
  module.WeaponToggle(Weapon)
  module.CloseInventory()
end)

onServer("esx:inventory:ammoadd", function(Amount)
  module.AmmoAdd(Amount)
  module.CloseInventory()
end)