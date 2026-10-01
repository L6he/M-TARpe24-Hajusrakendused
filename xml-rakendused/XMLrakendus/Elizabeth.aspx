<%@ Page Title="Elizabeth" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Elizabeth.aspx.cs" Inherits="XMLrakendus.Elizabeth" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <asp:Xml ID="xml3" runat="server" DocumentSource="~/elizabeth.xml" TransformSource="~/elizabeth.xslt" />
    </main>

</asp:Content>