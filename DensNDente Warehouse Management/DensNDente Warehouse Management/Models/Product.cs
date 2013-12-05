﻿using DensNDente_Warehouse_Management.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DensNDente_Warehouse_Management.Models
{
    public class Product : IProduct
    {
         DensDBEntities repository;

        public Product()
        {
            if (repository == null)
            {
                repository = new DensDBEntities();
            }
        }

        public IEnumerable<tblProduct> GetAll()
        {
            try
            {
                return repository.tblProducts.Where(r => r.Deleted == false).Select(r => r);
            }
            catch (Exception)
            {

                return null;
            }
            
        }

        public List<tblProduct> GetProducts_Report() {

            try
            {
                return (from p in repository.tblProducts
                        orderby p.ProductName
                        select p).ToList();
            }
            catch (Exception)
            {

                return null;
            }

        }

        public tblProduct Get(int id)
        {

            try
            {
                return repository.tblProducts.Where(r => r.ProductId == id).Select(r => r).First();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool Update(tblProduct obj)
        {

            try
            {
                tblProduct result = Get(obj.ProductId);
                if (result != null)
                {
                    repository.Entry(result).CurrentValues.SetValues(obj);
                    repository.SaveChanges();
                    return true;
                }
                return false;

            }
            catch (Exception)
            {

                return false;
            }
        }

        public bool Delete(int id)
        {

            try
            {
                tblProduct result = Get(id);
                if (result != null)
                {
                    result.Deleted = true;
                    repository.SaveChanges();
                    return true;
                }
                return false;
            }
            catch (Exception)
            {
                return false;

            }
        }


        public bool Add(tblProduct obj)
        {

            try
            {
                repository.tblProducts.Add(obj);
                repository.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

 public int Get_SafteyStockLevel_Count()
        {

            try
            {
                return repository.tblProducts.Where(r => r.Quantity < r.SafetyStockLevel).Count();
            }
            catch (Exception)
            {

                return 0;
            }

        }

    }
}