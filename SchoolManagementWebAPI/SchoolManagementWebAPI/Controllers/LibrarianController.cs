using Microsoft.AspNetCore.Mvc;
using SchoolManagementWebAPI.Models;
using SchoolManagementWebAPI.Repo;

namespace SchoolManagementWebAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LibrarianController : ControllerBase
    {
        private readonly LibrarianRepo repo;
        
        public LibrarianController(LibrarianRepo repo)
        {
            this.repo = repo;
        }

        [Route("GetAllBooks")]
        [HttpGet]
        public IActionResult GetAllBooks()
        {
            var data = repo.GetAllBooks();
            if (data == null)
            {
                return null;
            }
            else
            {
                return Ok(data);
            }
            
<<<<<<< HEAD
        }

        [Route("AddBooks")]
        [HttpPost]
        public IActionResult AddBooks(Book b)
        {
            repo.AddBook(b);
            return Ok("successfully added book");
        }

        



        [Route("GetBookById/{id}")]
        [HttpGet]
        public IActionResult GetBook(int id)
        {
            var book = repo.GetBookById(id);
            if (book == null)
            {
                return NotFound("Book not found");
            }
            return Ok(book);
        }

        



        [Route("UpdateBook")]
        [HttpGet]
        public IActionResult UpdateBook(Book book)
        {
            var d = repo.GetBookById(book.BookId);
            if (d == null)
            {
                return NotFound("Book not found");
            }

            repo.UpdateBook(d);
            return Ok("Book updated successfully");
        }




        [Route("DeleteBook/{id}")]
        [HttpDelete]
        public IActionResult DeleteBook(int id)
        {
            var d = repo.GetBookById(id);
            if (d == null)
            {
                return NotFound("Book not found");
            }

            repo.DeleteBook(id);
            return Ok("Book deleted successfully");
        }


        [Route("GetAllIssuedBooks")]
        [HttpGet]
        public IActionResult GetAllIssuedBooks()
        {
            var d = repo.GetAllIssuedBooks();
            return Ok(d);
        }

        [Route("GetIssuedBookById/{id}")]
        [HttpGet]
        public IActionResult GetIssuedBookById(int id)
        {
            var b = repo.GetIssuedBookById(id);
            if (b == null)
            {
                return NotFound("Book not found");
            }
            return Ok(b);
        }

        [Route("IssueBook")]
        [HttpPost]
        public IActionResult IssueBook(IssuedBook issuedBook)
        {
            repo.IssueBook(issuedBook);

            return Ok("Book issued successfully");
        }




        [Route("Return/{id}")]
        [HttpPut]
        public ActionResult ReturnBook(int id, string returnDate)
        {
            repo.ReturnBook(id, returnDate);
            return Ok(new { message = "Book returned successfully" });
        }

        [Route("late/{id}")]
        [HttpGet]
        public ActionResult<decimal> CalculateLateFee(int id, string returnDate)
        {
            var lateFee = repo.CalculateLateFee(id, returnDate);
            return Ok(lateFee);
        }


    }
}
=======
        }

        [Route("AddBooks")]
        [HttpPost]
        public IActionResult AddBooks(Book b)
        {
            repo.AddBook(b);
            return Ok("successfully added book");
        }


    }
}
>>>>>>> bec1b9bce69fb7d69e450f47a7a0077e3ebe1a80
