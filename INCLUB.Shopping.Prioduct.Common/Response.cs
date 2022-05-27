using System;

namespace INCLUB.Shopping.Prioduct.Common
{
    public class Response<T>
    {
        public bool Success { get; private set; }
        public string Exception { get; private set; }
        public T Result { get; set; }
        public Response(T arg)
        {
            Result = arg;
            Success = Constants.True;
            Exception = null;
        }
        public Response(Exception ex)
        {
            Exception = ex.Message;
            Success = Constants.False;
            Result = default(T);
        }
    }
}
