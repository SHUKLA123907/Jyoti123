using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using SchoolManagementWebApp.Models;
using System.Text;

namespace SchoolManagementWebApp.Controllers
{
    public class LibrarianController : Controller
    {
        HttpClient client;

        public LibrarianController()
        {
            HttpClientHandler clienthandler = new HttpClientHandler();
            clienthandler.ServerCertificateCustomValidationCallback = (sender, cert, chain, SslPolicyErrors) => { return true; };
            client = new HttpClient(clienthandler);
        }
        public IActionResult LibrarianDashboard()
        {
            return View();
        }

        
        public IActionResult ViewBooks()
        {
            List<Book> books = new List<Book>();
            string url = "https://localhost:7238/api/Librarian/GetAllBooks";
            HttpResponseMessage response = client.GetAsync(url).Result;
            if (response.IsSuccessStatusCode)
            {
                var jsondata = response.Content.ReadAsStringAsync().Result;
                books = JsonConvert.DeserializeObject<List<Book>>(jsondata);
                return View(books);
            }
            else
            {
                return View();
            }
        }

        public IActionResult AddBooks()
        {
            return View();

            
        }

        [HttpPost]
        public IActionResult AddBooks(Book b)
        {
            string url = "https://localhost:7238/api/Librarian/AddBooks";
            var jsondata = JsonConvert.SerializeObject(b);
            StringContent stringContent = new StringContent(jsondata,Encoding.UTF8,"application/json");
            HttpResponseMessage res = client.PostAsync(url, stringContent).Result;
            if(res.IsSuccessStatusCode)
            {
                TempData["Msg"] = "Book Added Successfully";
                return RedirectToAction("ViewBooks");
            }
            else
            {
                TempData["Msg"] = "Something Went Wrong Please try again later";
                return View();
            }
        }

        [HttpGet]
        public IActionResult DeleteBook(int id)
        {
            string url = $"https://localhost:7238/api/Librarian/DeleteBook/{id}";
            HttpResponseMessage response = client.DeleteAsync(url).Result;
            if (response.IsSuccessStatusCode)
            {
                TempData["msgDel"] = "Delete Book Successfully";
                return RedirectToAction("ViewBooks");
            }
            else
            {
                return View();
            }


        }


        public IActionResult UpdateBook(int id)
        {
            Book book = new Book();
            string url = $"https://localhost:7238/api/Librarian/GetBookById/{id}";

            HttpResponseMessage response = client.GetAsync(url).Result;
            if (response.IsSuccessStatusCode)
            {
                var jsondata = response.Content.ReadAsStringAsync().Result;
                var obj = JsonConvert.DeserializeObject<Book>(jsondata);
                if (obj != null)
                {
                    book = obj;
                }
            }
            return View(book);

        }

        [HttpPost]
        public IActionResult UpdateBook(int id, Book b)
        {

            string url = $"https://localhost:7238/api/Librarian/UpdateBook/{id}";
            var jsondata = JsonConvert.SerializeObject(b);
            StringContent stringContent = new StringContent(jsondata, Encoding.UTF8, "application/json");
            HttpResponseMessage response = client.PutAsync(url, stringContent).Result;

            if (response.IsSuccessStatusCode)
            {

                return RedirectToAction("ViewBooks");
            }
            return View();

        }



        public IActionResult GetBooks()
        {
            List<Book> books = new List<Book>();

            string url = "https://localhost:7238/api/Librarian/GetBooks";
            HttpResponseMessage response = client.GetAsync(url).Result;

            if (response.IsSuccessStatusCode)
            {
                var jsondata = response.Content.ReadAsStringAsync().Result;
                books = JsonConvert.DeserializeObject<List<Book>>(jsondata);
                return RedirectToAction("Index");
            }

            return View();
        }


        [HttpGet]
        public JsonResult GetUsers()
        {
            string url = "https://localhost:7238/api/Librarian/GetUsers";
            HttpResponseMessage response = client.GetAsync(url).Result;

            if (response.IsSuccessStatusCode)
            {
                var jsondata = response.Content.ReadAsStringAsync().Result;
                var users = JsonConvert.DeserializeObject<List<User>>(jsondata);
                return Json(users);
            }

            return Json(null);
        }


        public IActionResult Index()
        {
            List<IssuedBook> issuedBook = new List<IssuedBook>();
            string url = "https://localhost:7238/api/Librarian/GetAllIssuedBooks";
            HttpResponseMessage response = client.GetAsync(url).Result;

            if (response.IsSuccessStatusCode)
            {
                var jsondata = response.Content.ReadAsStringAsync().Result;

                var obj = JsonConvert.DeserializeObject<List<IssuedBook>>(jsondata);
                if (obj != null)
                {

                    issuedBook = obj;
                }

            }
            return View(issuedBook);
        }

        public IActionResult IssueBookAdd()
        {
            return View();
        }

        [HttpPost]
        public IActionResult IssueBookAdd(IssuedBook issuedBook)
        {
            string url = "https://localhost:7238/api/Librarian/IssueBookAdd";
            var jsondata = JsonConvert.SerializeObject(issuedBook);
            StringContent stringContent = new StringContent(jsondata, Encoding.UTF8, "application/json");
            HttpResponseMessage response = client.PostAsync(url, stringContent).Result;

            if (response.IsSuccessStatusCode)
            {
                TempData["msgIssue"] = "Issue Book Successfully";
                return RedirectToAction("Index");

            }

            return View();

        }

        public IActionResult ReturnBook()
        {
            return View();
        }


        [HttpPost]
        public IActionResult ReturnBook(int id, string returnDate)
        {
            string url = $"https://localhost:7238/api/Librarian/Return/{id}?returnDate={returnDate}";
            var updateData = new { IssueID = id, ReturnDate = returnDate };
            var jsondata = JsonConvert.SerializeObject(updateData);
            StringContent stringContent = new StringContent(jsondata, Encoding.UTF8, "application/json");
            HttpResponseMessage response = client.PutAsync(url, stringContent).Result;

            if (response.IsSuccessStatusCode)
            {
                TempData["msgReturn"] = "Book returned successfully.";
                return RedirectToAction("Index");
            }
            return View();
        }




        public IActionResult LateFee()
        {
            return View();
        }



        [HttpPost]
        public IActionResult LateFee(int id, string returnDate)
        {
            string lateFeeUrl = $"https://localhost:7238/api/Librarian/late/{id}?returnDate={returnDate}";
            HttpResponseMessage response = client.GetAsync(lateFeeUrl).Result;

            if (response.IsSuccessStatusCode)
            {
                var lateFeeData = response.Content.ReadAsStringAsync().Result;
                ViewBag.LateFee = lateFeeData;
                return RedirectToAction("Index");
            }
            ModelState.AddModelError("", "Failed to calculate late fee.");
            return View();
        }


        public IActionResult GenerateCard()
        {
            return View();
        }
    }
}
