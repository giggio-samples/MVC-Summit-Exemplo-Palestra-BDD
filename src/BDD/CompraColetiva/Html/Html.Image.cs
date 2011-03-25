using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace CompraColetiva.Html
{
    public static partial class ImageExtensions
    {
        public static MvcHtmlString Image(this HtmlHelper<dynamic> helper, string source, object values = null)
        {
            var htmlImg = RenderImage(helper, values, source);
            return new MvcHtmlString(htmlImg);
        }

        private static string RenderImage(HtmlHelper<dynamic> helper, object values, string source)
        {
            var builder = new TagBuilder("img");
            builder.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(values));
            source = ObterUrlImagem(helper, source);
            builder.MergeAttribute("src", source);
            return builder.ToString(TagRenderMode.SelfClosing);
        }

        public static MvcHtmlString ImageComLink(this HtmlHelper<dynamic> helper, string source, string link, object valuesAncora = null, object valuesImg = null)
        {
            var htmlImagem = RenderImage(helper, valuesImg, source);
            var builder = new TagBuilder("a");
            builder.MergeAttributes(HtmlHelper.AnonymousObjectToHtmlAttributes(valuesAncora));
            builder.MergeAttribute("href", link);
            builder.InnerHtml = htmlImagem;
            return new MvcHtmlString(builder.ToString(TagRenderMode.Normal));
        }
        public static MvcHtmlString CenteredImage(this HtmlHelper<dynamic> helper, string source, object values = null)
        {
            var image = Image(helper, source, values);
            var htmlImagem = string.Format(@"<p style=""text-align: center;"">{0}</p>", image);
            var retorno = MvcHtmlString.Create(htmlImagem);
            return retorno;
        }
        private static string ObterUrlImagem(this HtmlHelper<dynamic> helper, string source)
        {
            source = "~/Content/images/" + source;
            source = UrlHelper.GenerateContentUrl(source, helper.ViewContext.HttpContext);
            return source;
        }
    }
}
    