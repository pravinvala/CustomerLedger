using DemoApplication.Data;
using DemoApplication.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DemoApplication.Controllers
{
    public class CustomerController : Controller
    {
        // GET: Customer
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult GetAllCustomer()
        {
            var DBContext = new CustomerDataEntities();

            var customer = DBContext.TBL_Customer.Select(x => new Customer
            {
                FirstName = x.FirstName,
                LastName = x.LastName,
                City = x.TBL_City.Name,
                ID = x.ID,
                DOB = x.DOB??DateTime.Now,
                DOBString = x.DOB.Value.Day+"/"+ x.DOB.Value.Month+"/"+ x.DOB.Value.Year,
                ContactNumber = x.Contact,
                TurnOver = x.Turnover??0,
                Address=x.Address,
            }).ToList();

            return Json(new {isSuceess=true, data = customer }, JsonRequestBehavior.AllowGet);

        }
        public ActionResult DeleteCustomer(int id)
        {
            try
            {
                var DBContext = new CustomerDataEntities();
                var customer = DBContext.TBL_Customer.Where(x => x.ID == id).FirstOrDefault();
                DBContext.TBL_Customer.Remove(customer);
                DBContext.SaveChanges();
                return Json(new { isSuccess = true }, JsonRequestBehavior.AllowGet);
            }
            catch(Exception e)
            {
                return Json(new { isSuccess = false }, JsonRequestBehavior.AllowGet);
            }

        }

        public ActionResult Create(int? id)
        {
            try
            {
                var DBContext = new CustomerDataEntities();
                ViewBag.City = DBContext.TBL_City.Select(x => new SelectListItem
                {
                    Text = x.Name,
                    Value = x.ID.ToString(),
                }).ToList();
                var customer = DBContext.TBL_Customer.Where(x=>x.ID==id).Select(x => new Customer
                {
                    FirstName = x.FirstName,
                    LastName=x.LastName,
                    Address=x.Address,
                    CityID= x.CityID??0,
                    ID = x.ID,
                    DOB = x.DOB??DateTime.Now,
                    ContactNumber = x.Contact,
                    TurnOver = x.Turnover??0,
                }).FirstOrDefault();
                return View(customer);
            }
            catch (Exception e)
            {
                return View();
            }
        }
        [HttpPost]
        public ActionResult Create(Customer model)
        {
            string ResultMessage;
            try
            {
                var DBContext = new CustomerDataEntities();
                
                var CustomerModel = new TBL_Customer
                {
                    FirstName = model.FirstName,
                    LastName = model.LastName,
                    Address = model.Address,
                    CityID = model.CityID,
                    DOB = model.DOB,
                    Contact=model.ContactNumber,
                    Turnover=model.TurnOver,
                    ID = model.ID
                };
                if (model.ID > 0)
                {
                    DBContext.Entry(CustomerModel).State = EntityState.Modified;
                    ResultMessage = "Customer Update Sucessfuly";
                }
                else
                {
                    DBContext.TBL_Customer.Add(CustomerModel);
                    ResultMessage = "Customer Added Sucessfuly";
                }
                DBContext.SaveChanges();
                TempData["ResultMessage"] = ResultMessage;
                return Json(new { isSuccess = true, Message = ResultMessage });
            }
            catch (Exception e)
            {
                return Json(new { isSuccess = true, Message = "Something went wrong" });
            }

            
        }
    }
}