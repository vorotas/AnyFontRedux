local anyFontPath = "Interface\\AddOns\\AnyFontRedux\\font.ttf"

local f = CreateFrame("Frame");
local MyFontString = CreateFont("font");

local defaults = {
  damageFont = true,
  playerNameFont = true,
  namePlateFont = true
}

function f:OnEvent(event, addOnName)
  if addOnName == "AnyFontRedux" then
    AnyFontReduxDB = AnyFontReduxDB or (defaults);
    self.db = AnyFontReduxDB
    self:InitializeOptions();
    if self.db.damageFont then
      STANDARD_TEXT_FONT = anyFontPath;
      DAMAGE_TEXT_FONT = anyFontPath;
      NAMEPLATE_SPELLCAST_FONT = anyFontPath;
      FontSet = MyFontString:SetFont(anyFontPath, 11, "OUTLINE, MONOCHROME");
      print(FontSet);
      if FontSet then
        MyFontString:SetFontObject(CombatTextFont);
        MyFontString:SetFontObject(CombatLogFont);
      end
    end

    if self.db.playerNameFont then
      UNIT_NAME_FONT = anyFontPath;
      FontSet = MyFontString:SetFont(anyFontPath, 11, "OUTLINE, MONOCHROME");
      print(FontSet);
      if FontSet then
        MyFontString:SetFontObject(CombatTextFont);
        MyFontString:SetFontObject(CombatLogFont);
      end
    end
    if self.db.namePlateFont then
      NAMEPLATE_FONT = anyFontPath;
      FontSet = MyFontString:SetFont(anyFontPath, 11, "OUTLINE, MONOCHROME");
      print(FontSet);
      if FontSet then
        MyFontString:SetFontObject(CombatTextFont);
        MyFontString:SetFontObject(CombatLogFont);
      end
    end
  end
end

f:RegisterEvent("ADDON_LOADED");
f:SetScript("OnEvent", f.OnEvent);

function f:InitializeOptions()
  self.panel = CreateFrame("Frame")
  self.panel.name = "AnyFont Redux"

  local dm = CreateFrame("CheckButton", nil, self.panel, "InterfaceOptionsCheckButtonTemplate")
  dm:SetPoint("TOPLEFT", 20, -20)
  dm.Text:SetText("Change Damage Font")
  -- there already is an existing OnClick script that plays a sound, hook it
  dm:HookScript("OnClick", function(_, btn, down)
    self.db.damageFont = dm:GetChecked()
  end)
  dm:SetChecked(self.db.damageFont);

  local pf = CreateFrame("CheckButton", nil, self.panel, "InterfaceOptionsCheckButtonTemplate")
  pf:SetPoint("TOPLEFT", 20, -50)
  pf.Text:SetText("Change Unit Text Font")
  -- there already is an existing OnClick script that plays a sound, hook it
  pf:HookScript("OnClick", function(_, btn, down)
    self.db.playerNameFont = pf:GetChecked()
  end)
  pf:SetChecked(self.db.playerNameFont)

  local nf = CreateFrame("CheckButton", nil, self.panel, "InterfaceOptionsCheckButtonTemplate")
  nf:SetPoint("TOPLEFT", 20, -80)
  nf.Text:SetText("Change Name Plate Font")
  -- there already is an existing OnClick script that plays a sound, hook it
  nf:HookScript("OnClick", function(_, btn, down)
    self.db.namePlateFont = nf:GetChecked()
  end)
  nf:SetChecked(self.db.namePlateFont)

  -- local btn = CreateFrame("Button", nil, self.panel, "UIPanelButtonTemplate")
  -- btn:SetPoint("TOPLEFT", cb, 0, -40)
  -- btn:SetText("Click me")
  -- btn:SetWidth(100)
  -- btn:SetScript("OnClick", function()
  -- 	print("You clicked me!")
  -- end)

  InterfaceOptions_AddCategory(self.panel)
end
