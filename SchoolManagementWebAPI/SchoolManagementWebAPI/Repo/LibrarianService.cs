using Microsoft.EntityFrameworkCore;
using SchoolManagementWebAPI.Data;
using SchoolManagementWebAPI.Models;

namespace SchoolManagementWebAPI.Repo
{
    public class LibrarianService :LibrarianRepo
    {
        private readonly ApplicationDbContext db;

        public LibrarianService(ApplicationDbContext db)
        {
            this.db = db;
        }


        public List<Book> GetAllBooks()
        {
            var data = db.Books.FromSqlRaw("exec GetAllBooks ");
            if(data == null)
            {
                return null;
            }
            else
            {
                return data.ToList();
            }
            
        }

        public Book GetBookById(int id)
        {
            var data = db.Books.FromSqlRaw($"exec GetBookById {id} ").ToList().SingleOrDefault();
            return data;
        }


        public void AddBook(Book book)
        {
            db.Database.ExecuteSqlRaw($"exec AddBooks '{book.Title}','{book.AuthorName}','{book.ISBN}','{book.PublishedDate}','{book.NumberofCopies}'");

        }

        public void UpdateBook(Book book)
        {
            db.Database.ExecuteSqlRaw($"exec UpdateAll '{book.Title}','{book.AuthorName}','{book.ISBN}','{book.PublishedDate}',{book.NumberofCopies}");

        }

        public void DeleteBook(int id)
        {
            var data = db.Books.Find(id);
            if (data != null)
            {

                db.Books.Remove(data);
                db.SaveChanges();

            }
        }

        public decimal CalculateLateFee(int id, string returnDate)
        {
            var data = db.IssuedBooks.FromSqlRaw($"exec CalculateLateFee {id},'{returnDate}'").AsEnumerable()
                .Select(ib => ib.LateFee)
                .SingleOrDefault();
            return data;

        }

        public List<IssuedBook> GetAllIssuedBooks()
        {
            var data = db.IssuedBooks.FromSqlRaw($"exec GetAllIssuedBooks ").ToList();
            return data;
        }

        public IssuedBook GetIssuedBookById(int id)
        {
            var data = db.IssuedBooks.FromSqlRaw($"exec GetIssuedBookById {id} ").AsEnumerable().SingleOrDefault();
            return data;
        }

        public void IssueBook(IssuedBook issuedBook)
        {
            db.Database.ExecuteSqlRaw($"exec IssueBook {issuedBook.BookId},{issuedBook.Userid},'{issuedBook.IssueDate}','{issuedBook.ReturnDate}',{issuedBook.LateFee}");
        }

        public void ReturnBook(int id, string returnDate)
        {
            db.Database.ExecuteSqlRaw($"exec ReturnBook {id},'{returnDate}'");
        }

    }
}
