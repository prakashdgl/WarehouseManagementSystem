using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DensNDente_Warehouse_Management.EntityFramework;

namespace DensNDente_Warehouse_Management.Models
{
    interface IProductVendorLink
    {
        bool Bulk_Add(List<tblProductVendorLink> list);
    }
}
