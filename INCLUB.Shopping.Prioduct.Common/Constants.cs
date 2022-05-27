
namespace INCLUB.Shopping.Prioduct.Common
{
    public struct Constants
    {

        public const bool True = true;
        public const bool False = false;
        public struct ConextionBD
        {
            public struct providers
            {
                public const string SqlServer = "ConnectionString:cn-dapper";
            }
        }


        public struct StoreProcedure
        {
            public const string ManagementProduct = "Up_ManagementProduct";
        }


        public enum OperationType
        {
            None = 0,
            Insert = 1,
            Update = 2,
            Delete = 3,
            GetById = 4,
            GetAll = 5

        }
    }
}

