<%@ Page Title="Autod" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Autod.aspx.cs" Inherits="XMLrakendus.Autod" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <asp:Xml ID="xml2" runat="server" DocumentSource="~/autod.xml" TransformSource="~/autod1.xslt" />
    </main>

</asp:Content>
