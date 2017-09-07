{**
 * templates/index/journal.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Journal index page.
 *
 *}


{strip}
{assign var="pageTitleTranslated" value=$siteTitle}
{include file="common/header.tpl"}
{/strip}
<link rel="stylesheet" href="{$baseUrl}/lib/osu/osuHideSideBar.css" type="text/css" />

<div class="row">
  <p id="blurb">Oklahoma State Medical Proceedings is an online
    open access peer reviewed journal with an emphasis
    on articles by individuals in training. </p>
  <div class="col-xs-10 col-xs-offset-1">
    <div id="frontPageImage">
      <a href="{$baseUrl}/index.php/OSMP/about">
        <img
          sizes="(max-width: 1400px) 100vw, 1400px"
          srcset="
          {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_200.jpg 200w,
          {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_445.jpg 445w,
          {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_626.jpg 626w,
          {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_783.jpg 783w,
          {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_909.jpg 909w,
          {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_1048.jpg 1048w,
          {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_1157.jpg 1157w,
          {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_1259.jpg 1259w,
          {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_1365.jpg 1365w,
          {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_1399.jpg 1399w,
          {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_1400.jpg 1400w"
          src="{$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_1400.jpg"/>
        </a>
    </div>
  </div>
 </div>
<!-- <div id="frontPageImage">
  <a href="{$baseUrl}/index.php/OSMP/about">
    <img
      sizes="(max-width: 1400px) 100vw, 1400px"
      srcset="
      {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_200.jpg 200w,
      {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_445.jpg 445w,
      {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_626.jpg 626w,
      {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_783.jpg 783w,
      {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_909.jpg 909w,
      {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_1048.jpg 1048w,
      {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_1157.jpg 1157w,
      {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_1259.jpg 1259w,
      {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_1365.jpg 1365w,
      {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_1399.jpg 1399w,
      {$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_1400.jpg 1400w"
      src="{$baseUrl}/public/osuImages/TANDY_uv3yxq_c_scale,w_1400.jpg"/>
    </a>
</div> -->

<div class="clear"></div>
<hr class="style-one">




  <div class="row">
     <div class="col-xs-12 col-lg-3 col-lg-offset-1">
      {if $journalDescription}
      	<div id="journalDescription">{$journalDescription}</div>
      {/if}

      {call_hook name="Templates::Index::journal"}

      {if $homepageImage}
      <br />
      <div id="homepageImage"><img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}" width="{$homepageImage.width|escape}" height="{$homepageImage.height|escape}" {if $homepageImageAltText != ''}alt="{$homepageImageAltText|escape}"{else}alt="{translate key="common.journalHomepageImage.altText"}"{/if} /></div>
      {/if}

      <!-- {if $additionalHomeContent} -->
      <br />
      <div id="additionalHomeContent">{$additionalHomeContent}</div>
      <!-- {/if} -->

      {if $enableAnnouncementsHomepage}
      	{* Display announcements *}
      	<div id="announcementsHome">
      		<h3>{translate key="announcement.announcementsHome"}</h3>
      		{include file="announcement/list.tpl"}
      		<table class="announcementsMore">
      			<tr>
      				<td><a href="{url page="announcement"}">{translate key="announcement.moreAnnouncements"}</a></td>
      			</tr>
      		</table>
      	</div>
      {/if}


      {if $issue && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
      	{* Display the table of contents or cover page of the current issue. *}
      	<br />
      	<h3 id="issueHeader">{$issue->getIssueIdentification()|strip_unsafe_html|nl2br}</h3>
      	{include file="issue/currentIssue.tpl"}
      {/if}




      <!-- {include file="issue/issue.tpl"} -->





    <div class="col-xs-4 col-lg-2 ">
      <div class="center-twitter">
        <a class="twitter-timeline" data-height="650" data-theme="dark" data-link-color="#FAB81E" href="https://twitter.com/MedProceedings">Tweets by MedProceedings</a> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
        <!-- <a class="twitter-timeline" data-theme="dark" href="https://twitter.com/MedProceedings">Tweets by MedProceedings</a> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script> -->
      </div>
    </div>
<!-- end of row div  -->
</div>



{include file="common/footer.tpl"}
