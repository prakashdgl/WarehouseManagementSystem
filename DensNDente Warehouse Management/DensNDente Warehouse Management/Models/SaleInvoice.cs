using DensNDente_Warehouse_Management.EntityFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace DensNDente_Warehouse_Management.Models
{
    public class SaleInvoice : ISaleInvoice
    {
        DensDBEntities repository;

        public SaleInvoice()
        {
            if (repository == null)
            {
                repository = new DensDBEntities();
            }
        }

        public IEnumerable<tblSaleInvoice> GetAll()
        {

            try
            {
                return repository.tblSaleInvoices.Where(r => r.Deleted == false).Select(r => r);
            }
            catch (Exception)
            {

                return null;
            }

        }

        public tblSaleInvoice Get(int id)
        {

            try
            {
                return repository.tblSaleInvoices.Where(r => r.InvoiceId == id).Select(r => r).First();
            }
            catch (Exception)
            {
                return null;
            }
        }

        public bool Update(tblSaleInvoice obj)
        {

            try
            {
                tblSaleInvoice result = Get(obj.InvoiceId);
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
                tblSaleInvoice result = Get(id);
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


        public bool Add(tblSaleInvoice obj)
        {

            try
            {
                repository.tblSaleInvoices.Add(obj);
                repository.SaveChanges();
                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }
        public int GetId()
        {


            try
            {
                int[] invoiceID = repository.tblSaleInvoices.Where(r => r.Deleted == false).Select(r => r.InvoiceId).ToArray();
                int max = invoiceID.Max();
                return max;
            }
            catch (Exception)
            { return 0; }
        }
        public bool Bulk_Insert(tblSaleInvoice order, List<tblSaleInvoiceDetail> orderDetails)
        {

            try
            {
                foreach (var item in orderDetails)
                {
                    order.tblSaleInvoiceDetails.Add(item);
                }

                repository.tblSaleInvoices.Add(order);
                repository.SaveChanges();

                return true;
            }
            catch (Exception)
            {

                return false;
            }
        }

        public decimal totalSaleByMonth(DateTime startDate, DateTime endDate)
        {
            try
            {
                return (from p in repository.tblSaleInvoices
                        where p.InvoiceDate >= startDate && p.InvoiceDate <= endDate
                        select p.TotalSale).Sum();
            }
            catch (Exception)
            {

                return 0;
            }
        }

        public class ReportProductByTime
        {
            public string ProductName { get; set; }
            public int TotalQTY { get; set; }
        }

        public List<ReportProductByTime> getProductByTime(DateTime StartTime, DateTime EndTime)
        {

            try
            {

                var product = (from p in repository.tblSaleInvoiceDetails
                               where p.tblSaleInvoice.InvoiceDate >= StartTime && p.tblSaleInvoice.InvoiceDate <= EndTime
                               group p by p.tblProduct.ProductName into g
                               let totalQty = g.Select(r => r.Quantity).Sum()
                               orderby totalQty descending
                               select new ReportProductByTime { ProductName = g.Key, TotalQTY = totalQty }).ToList();
                return product;
            }
            catch (Exception)
            {

                return null;
            }

        }


        public List<ReportProductByTime> getProductByCustomer(int id)
        {
            try
            {
                var product = (from p in repository.tblSaleInvoiceDetails
                               where p.tblSaleInvoice.CustomerId == id
                               group p by p.tblProduct.ProductName into g
                               let totalQty = g.Select(r => r.Quantity).Sum()
                               orderby totalQty descending
                               select new ReportProductByTime { ProductName = g.Key, TotalQTY = totalQty }).ToList();
                return product;
            }
            catch (Exception)
            {
                return null;
            }

        }

    }
}