using FactorioProject_sbandoli.model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FactorioProject_sbandoli
{
    public partial class Contact : System.Web.UI.Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Boolean isUniqueName = true;

            DataSourceSelectArguments arguments = new DataSourceSelectArguments();
            foreach (DataRowView view in UserMessageTable.Select(arguments))
            {
                if (view.Row["Name"].Equals(txtName.Text))
                {
                    isUniqueName = false;
                }
            }

            if (isUniqueName)
            {
                // Create and populate a UserAccount object
                UserAccount account = new UserAccount();

                account.fullName = txtName.Text;
                account.date = txtDate.Text;
                account.emailAddress = txtEmail.Text;
                account.subject = txtSubject.Text;
                account.message = txtMessage.Text;

                // Add the new user account to the database
                UserMessageTable.InsertParameters["Name"].DefaultValue = account.fullName;
                UserMessageTable.InsertParameters["Date"].DefaultValue = account.date;
                UserMessageTable.InsertParameters["Email"].DefaultValue = account.emailAddress;
                UserMessageTable.InsertParameters["Subject"].DefaultValue = account.subject;
                UserMessageTable.InsertParameters["Message"].DefaultValue = account.message;

                UserMessageTable.Insert();

                // Add the account to the session
                Session.Add("AuthenticatedUser", account);
            }
            else
            {
                // Account isn't unique
                Response.Redirect("Contact.aspx");
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
    }
}