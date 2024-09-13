using System.ComponentModel.DataAnnotations;

namespace SchoolManagementWebAPI.Models
{
    public class Book
    {
        [Key]
        public int BookId { get; set; }
        public string Title { get; set; }
        public string AuthorName { get; set; }
        public string ISBN { get; set; }
        public DateOnly PublishedDate { get; set; }
        public int NumberofCopies { get; set; }
    }
}
