//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DensNDente_Warehouse_Management.EntityFramework
{
    using System;
    using System.Collections.Generic;
    
    public partial class tblCustomer
    {
        public tblCustomer()
        {
            this.tblSaleInvoices = new HashSet<tblSaleInvoice>();
        }
    
        public int CustomerId { get; set; }
        public string Firstname { get; set; }
        public string Lastname { get; set; }
        public string Title { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public string PostalCode { get; set; }
        public string Email { get; set; }
        public string Phone { get; set; }
        public string Fax { get; set; }
        public bool Deleted { get; set; }
    
        public virtual ICollection<tblSaleInvoice> tblSaleInvoices { get; set; }
    }
}
