local PANEL = {}

function PANEL:Init( )
	self.image = vgui.Create( "DPreRenderedModelPanel", self )
	self.image:Dock( FILL )
	self.image:SetSize( 64, 64 )
	self.image:SetMouseInputEnabled( false )
end

function PANEL:SetItem( item )
	local model = Pointshop2:GetPreviewModel() or "models/player/kleiner.mdl"
	self.image:SetModel( model )
	self.item = item 
	self.image:SetPacOutfit( item.class.getOutfitForModel( model ) )
	self.image:SetViewInfo( item.class.iconInfo.inv.iconViewInfo )
end

function PANEL:OnSelected( )
	self.image.forceRender = true
end

function PANEL:OnDeselected( )
	self.image.forceRender = false
end

function PANEL:Paint( w, h )
	surface.SetDrawColor( Color( 255, 0, 0 ) )
	surface.DrawRect( 0, 0, w, h )
end

vgui.Register( "DPointshopHatInvIcon", PANEL, "DPointshopInventoryItemIcon" )