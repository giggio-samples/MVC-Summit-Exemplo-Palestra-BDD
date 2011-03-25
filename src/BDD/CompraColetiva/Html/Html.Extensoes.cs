using System.Web.Mvc;

namespace CompraColetiva.Html
{
    public static class Extensoes
    {
        public static MvcHtmlString EscreveSe<T>(
            this HtmlHelper<T> helper,
            bool condicao, MvcHtmlString texto)
        {
            return condicao ? texto : MvcHtmlString.Create("");
        }
        public static MvcHtmlString EscreveSe<T>(
            this HtmlHelper<T> helper,
            bool condicao, string texto)
        {
            return condicao ? MvcHtmlString.Create(texto) : MvcHtmlString.Create("");
        }
        public static UrlHelper Url(this HtmlHelper helper)
        {
            return new UrlHelper(helper.ViewContext.RequestContext);
        }
        public static string LimitarEm(this string texto, int tamanho)
        {
            if (string.IsNullOrEmpty(texto))
                return texto;
            return texto.Length <= tamanho ? texto : texto.Substring(0, tamanho - 4) + " ...";
        }
    }
}