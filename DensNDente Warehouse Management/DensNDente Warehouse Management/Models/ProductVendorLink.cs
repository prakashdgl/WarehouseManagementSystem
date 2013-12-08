using DensNDente_Warehouse_Management.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DensNDente_Warehouse_Management.Models
{
    public class ProductVendorLink : IProductVendorLink
    {
        DensDBEntities repository;
        public ProductVendorLink()
        {
            if (repository == null)
            {
                repository = new DensDBEntities();
            }
        }



        public bool Bulk_Add(List<tblProductVendorLink> list)
        {

            try
            {
                // Delete all link with vendor
                int id = list[0].VendorId;
                var oldProduct = repository.tblProductVendorLinks.Where(r => r.VendorId == id).Select(r => r).ToList();
                if (oldProduct.Count > 0)
                {
                    foreach (var item in oldProduct)
                        repository.tblProductVendorLinks.Remove(item);
                }


                foreach (var item in list)
                {
                    repository.tblProductVendorLinks.Add(item);
                }
                repository.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }

        }


        public List<tblProduct> Get(int id)
        {
            try
            {
                var productId = repository.tblProductVendorLinks.Where(r => r.VendorId == id).Select(r => r.ProductId).Distinct().ToArray();

                if (productId.Length > 0)
                {

                    return (from r in repository.tblProducts
                            where productId.Contains(r.ProductId)
                            select r).ToList();
                }
                else
                    return null;
            }
            catch (Exception)
            {
                return null;
            }
        }

    }
}