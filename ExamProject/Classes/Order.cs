using System.Security.RightsManagement;

namespace ExamProject.Classes
{
    public class Order
    {
        public int IdOrder { get; set; }
        public DateTime DateOrder { get; set; }
        public DateTime DateDelivery { get; set; }
        public int PickUpPoint {  get; set; }
        public int? IdUser { get; set; }
        public int IdDeliveryPoint { get; set; }
        public int IdStatusOrder { get; set; }
        
        public decimal OrderSum { get; set; }
        public decimal DiscountSum { get; set; }
        public int OrderComposition { get; set;}
        
    }
}
