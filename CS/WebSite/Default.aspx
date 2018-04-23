<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v13.2, Version=13.2.7.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script>
        var savedTokenCollection = [];
        function onTokensChanged(s, e) {
            if (s.GetSelectedIndex() != -1)
                s.RemoveItem(s.GetSelectedIndex());
            else {
                var selectedTokenCollection = s.GetTokenCollection();
                var item = savedTokenCollection.toString();
                for (var i = 0; i < selectedTokenCollection.length; i++) {
                    item = item.replace(selectedTokenCollection[i], "");
                }
                item = item.replace(/,/g, "")
                s.AddItem(item);
            }
            savedTokenCollection = s.GetTokenCollection();
        }
        function OnInit(s, e) {
            savedTokenCollection = s.GetTokenCollection();
        }
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <dx:ASPxTokenBox ID="ASPxTokenBox1" runat="server" ItemValueType="System.String">
                <Items>
                    <dx:ListEditItem Text="Andrew" />
                    <dx:ListEditItem Text="Boris" />
                    <dx:ListEditItem Text="Christina" />
                    <dx:ListEditItem Text="Daniel" />
                    <dx:ListEditItem Text="Elijah" />
                    <dx:ListEditItem Text="Freddy" />
                </Items>
                <ClientSideEvents TokensChanged="onTokensChanged" Init="OnInit" />
            </dx:ASPxTokenBox>
        </div>
    </form>
</body>
</html>
