{**
 * plugins/blocks/help/block.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Common site sidebar menu -- help pop-up link.
 *
 *}
<div class="hidden" id="sidebarHelp">
	<a class="blockTitle" href="javascript:openHelp('{if $helpTopicId}{get_help_id|escape key="$helpTopicId" url="true"}{else}{url page="help"}{/if}')">{translate key="navigation.journalHelp"}</a>
</div>
