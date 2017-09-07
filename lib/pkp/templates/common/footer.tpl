{**
 * templates/common/footer.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2000-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site footer.
 *
 *}
{if $displayCreativeCommons}
	{translate key="common.ccLicense"}
{/if}
{call_hook name="Templates::Common::Footer::PageFooter"}
{if $pageFooter}
	<br /><br />

	<div id="pageFooter">{$pageFooter}</div>
{/if}
</div><!-- content -->
</div><!-- main -->
</div><!-- body -->
<div class="clear"></div>
{get_debug_info}
{if $enableDebugStats}{include file=$pqpTemplate}{/if}
<div id="hide-bottom-menu">
  {include file="common/navbar.tpl"}
</div>


<div id="osuFooter">
  <a id="copyright" href="{$baseUrl}/index.php/OSMP/about/submissions#copyrightNotice">
    <img src="{$baseUrl}/public/osuImages/osu_CHS_side.png"/>
    <div class="clear"></div>
    <i class="fa fa-copyright" aria-hidden="true"></i> Okstate Copyright</a>
</div>

</div><!-- container -->
</body>
</html>
