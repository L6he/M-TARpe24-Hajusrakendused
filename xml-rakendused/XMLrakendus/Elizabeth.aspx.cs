using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Xsl;

namespace XMLrakendus
{
    public partial class Elizabeth : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            XsltArgumentList p = new XsltArgumentList();
            p.AddParam("otsing", "", kast1.Text);
            int abi;
            if (int.TryParse(kast2.Text, out abi))
            {
                p.AddParam("pikkus", "", kast2.Text);
            }
            xml1.TransformArgumentList = p;
        }
    }
}