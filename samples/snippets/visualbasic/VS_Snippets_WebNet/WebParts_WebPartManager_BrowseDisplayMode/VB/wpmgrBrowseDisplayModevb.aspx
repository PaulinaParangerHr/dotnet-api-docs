<!-- <snippet1> -->
<%@ Page Language="VB" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

  Protected Sub Page_Init(ByVal sender As Object, _
    ByVal e As EventArgs)
    Dim mode As WebPartDisplayMode
    For Each mode In mgr1.SupportedDisplayModes
      Dim modeName As String = mode.Name
      If mode.IsEnabled(mgr1) Then
        Dim item As ListItem = New ListItem(modeName, modeName)
        DisplayModeDropdown.Items.Add(item)
      End If
    Next
    
  End Sub

  Protected Sub DisplayModeDropdown_SelectedIndexChanged(ByVal _
    sender As Object, ByVal e As EventArgs)
    Dim selectedMode As String = _
      DisplayModeDropdown.SelectedValue
    Dim mode As WebPartDisplayMode = _
      mgr1.SupportedDisplayModes(selectedMode)
    If mode IsNot Nothing Then
      mgr1.DisplayMode = mode
    End If
  End Sub
  
  Protected Sub Page_PreRender(ByVal sender As Object, _
    ByVal e As System.EventArgs)
    If mgr1.DisplayMode.Equals(WebPartManager.BrowseDisplayMode) Then
      Label1.Visible = True
    Else
      Label1.Visible = False
    End If
  End Sub
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>ASP.NET Example</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <asp:WebPartManager ID="mgr1" runat="server">
      </asp:WebPartManager>
      <asp:WebPartZone ID="WebPartZone1" runat="server">
        <ZoneTemplate>
          <asp:Calendar ID="Calendar1" runat="server" 
            Title="My Calendar" />
        </ZoneTemplate>
      </asp:WebPartZone>
      <asp:WebPartZone ID="WebPartZone2" runat="server">
        <ZoneTemplate>
          <asp:BulletedList 
            DisplayMode="HyperLink" 
            ID="BulletedList1" 
            runat="server"
            Title="My Links">
            <asp:ListItem Value="http://www.microsoft.com">
            Microsoft
            </asp:ListItem>
            <asp:ListItem Value="http://www.msn.com">
            MSN
            </asp:ListItem>
            <asp:ListItem Value="http://www.contoso.com">
            Contoso Corp.
            </asp:ListItem>
          </asp:BulletedList>
        </ZoneTemplate>
      </asp:WebPartZone>
      <hr />
      <asp:Label ID="Label1" runat="server" 
        Text="Currently in Browse Mode" 
        Font-Bold="true"
        Font-Size="125%" />
      <br />
      <asp:DropDownList ID="DisplayModeDropdown" runat="server" 
        AutoPostBack="true"
        Width="120"
        OnSelectedIndexChanged=
        "DisplayModeDropdown_SelectedIndexChanged">
      </asp:DropDownList>
    </div>
    </form>
</body>
</html>
<!-- </snippet1> -->