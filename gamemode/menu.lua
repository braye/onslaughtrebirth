local W, H = ScrW(), ScrH()

------------------------------------------------------------
--                  Spawn Menu (Q Menu)
------------------------------------------------------------

local PANEL = {}

function PANEL:Init()
    self:SetSize(750, 750)
    self:SetPos(0, H * 0.022)
    self:SetTitle("OS:R Menu")
    self.ContentPanel = vgui.Create("DPropertySheet", self)
    self:ShowCloseButton(false)
    MENU = self
end

function PANEL:Close()
end

function PANEL:PerformLayout()
    self.ContentPanel:StretchToParent(4, 26, 4, 4)
    DFrame.PerformLayout(self)
end

vgui.Register("osr_menu", PANEL, "DFrame")

function GM:OnSpawnMenuOpen() 
    if MENU == nil or not MENU:IsValid() then
        vgui.Create( "osr_menu" )
    else
        MENU:SetVisible(true)
    end
    
    gui.EnableScreenClicker(true)
    RestoreCursorPosition()
end

function GM:OnSpawnMenuClose( )
	if MENU and MENU:IsValid( ) and MENU:IsVisible( ) then
		MENU:SetVisible( false )
	end
	RememberCursorPosition( )
	gui.EnableScreenClicker( false )
end

------------------------------------------------------------
--                  Prop Panel
------------------------------------------------------------