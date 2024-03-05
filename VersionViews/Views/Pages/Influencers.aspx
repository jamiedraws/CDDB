<%@ Page Language="C#" MasterPageFile="~/VersionViews/Views/Layouts/InternalLayout.master" Inherits="System.Web.Mvc.ViewPage<ClientSiteViewData>" %>
<%@ Import Namespace="Dtm.Framework.ClientSites" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<main class="view influencer section" aria-labelledby="main-title">
    <div class="view__anchor" id="main"></div>
    <div class="bg bg--rainbow bg--rainbow--reverse bg--spacer"></div>
    <div class="view__in">
        <div class="influencer__header">
            <h1 class="title title--rainbow influencer__title" id="main-title">Get #ColoredByBatiste</h1>
            <h2 class="title-sub color--dull">Because if you didn't post about it, did it really happen?</h2>
        </div>
        <div class="influencer__content">
            <div class="slide slide--influencer">
                <div id="carousel-influencer" class="slide__into">
                    <div class="slide__item">
                        <div data-src-iframe="https://player.vimeo.com/video/639299594" class="contain contain--influencer">
                            <iframe src="" width="608" height="1080" title="Karina" allow="fullscreen"></iframe>
                        </div>
                    </div>
                    <div class="slide__item">
                        <div data-src-iframe="https://player.vimeo.com/video/639299632"  class="contain contain--influencer">
                            <iframe src="" width="608" height="1080" title="katelyn" allow="fullscreen"></iframe>
                        </div>
                    </div>
                    <div class="slide__item">
                        <div data-src-iframe="https://player.vimeo.com/video/640136880" class="contain contain--influencer">
                            <iframe src="" width="608" height="1080" title="Shakira" allow="fullscreen"></iframe>
                        </div>
                    </div>
                    <div class="slide__item">
                        <div data-src-iframe="https://player.vimeo.com/video/640137429" class="contain contain--influencer">
                            <iframe src="" width="608" height="1080" title="Nicole" allow="fullscreen"></iframe>
                        </div>
                    </div>
                    <div class="slide__item">
                        <div data-src-iframe="https://player.vimeo.com/video/639299737" class="contain contain--influencer">
                            <iframe src="" width="608" height="1080" title="Shelia" allow="fullscreen"></iframe>
                        </div>
                    </div>
                    <div class="slide__item">
                        <div data-src-iframe="https://player.vimeo.com/video/639299809" class="contain contain--influencer">
                            <iframe src="" width="608" height="1080" title="Katherine" allow="fullscreen"></iframe>
                        </div>
                    </div>
                    <div class="slide__item">
                        <div data-src-iframe="https://player.vimeo.com/video/640138514" class="contain contain--influencer">
                            <iframe src="" width="608" height="1080" title="Kylee" allow="fullscreen"></iframe>
                        </div>
                    </div>
                    <div class="slide__item">
                        <div data-src-iframe="https://player.vimeo.com/video/652510790" class="contain contain--influencer">
                            <iframe src="" width="608" height="1080" title="Elendelrosario" allow="fullscreen"></iframe>
                        </div>
                    </div>
                </div>
                <nav class="slide__nav slide__nav--persist">
                    <button
                        aria-label="Select the previous slide"
                        class="slide__prev"
                        type="button"
                    >
                        <svg class="icon"><use href="#icon-chevron"></use></svg>
                    </button>
                    <button
                        aria-label="Select the next slide"
                        class="slide__next"
                        type="button"
                    >
                        <svg class="icon"><use href="#icon-chevron"></use></svg>
                    </button>
                </nav>
            </div>
        </div>
    </div>
</main>

</asp:Content>