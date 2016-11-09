{**
 * templates/common/navbar.tpl
 *
 * Copyright (c) 2013-2016 Simon Fraser University Library
 * Copyright (c) 2003-2016 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Navigation Bar
 *
 *}
<div id="navbar" class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
    	<ul class="menu nav navbar-nav">
    		<li><a href="{url page="index"}">{translate key="navigation.home"}</a></li>
        <li class="splitter"></li>
    		<li><a href="{url page="about"}">{translate key="navigation.about"}</a></li>
        <li class="splitter"></li>

    		{if $isUserLoggedIn}
    			<li><a href="{if $hasOtherJournals}{url journal="index" page="user"}{else}{url page="user"}{/if}">{translate key="navigation.userHome"}</a></li>
          <li class="splitter"></li>

    		{else}
    			<!-- <li><a href="{url page="login"}">{translate key="navigation.login"}</a></li> -->
    			{if !$hideRegisterLink}
    				<li><a href="{url page="user" op="register"}">{translate key="navigation.register"}</a></li>
            <li class="splitter"></li>

    			{/if}
    		{/if}{* $isUserLoggedIn *}

    		{if $siteCategoriesEnabled}
    			<li><a href="{url journal="index" page="search" op="categories"}">{translate key="navigation.categories"}</a></li>
          <li class="splitter"></li>

    		{/if}{* $categoriesEnabled *}



    		{if $currentJournal && $currentJournal->getSetting('publishingMode') != $smarty.const.PUBLISHING_MODE_NONE}
    			<li><a href="{url page="issue" op="current"}">Current Issue</a></li>
          <li class="splitter"></li>

    			<li><a href="{url page="issue" op="archive"}">Back Issues</a></li>
          <li class="splitter"></li>

    		{/if}

    		{if $enableAnnouncements}
    			<li><a href="{url page="announcement"}">{translate key="announcement.announcements"}</a></li>
          <li class="splitter"></li>

    		{/if}{* enableAnnouncements *}

    		{call_hook name="Templates::Common::Header::Navbar::CurrentJournal"}

    		{foreach from=$navMenuItems item=navItem key=navItemKey}
    			{if $navItem.url != '' && $navItem.name != ''}
    				<li class="navItem" id="navItem-{$navItemKey|escape}"><a href="{if $navItem.isAbsolute}{$navItem.url|escape}{else}{$baseUrl}{$navItem.url|escape}{/if}">{if $navItem.isLiteral}{$navItem.name|escape}{else}{translate key=$navItem.name}{/if}</a></li>
            <li class="splitter"></li>

    			{/if}
    		{/foreach}

        <li><a href="{$baseUrl}/index.php/medj/notification/subscribeMailList">Subscribe</a></li>

        <li class="splitter"></li>

        <li><a href="{$baseUrl}/index.php/medj/about/submissions#copyrightNotice">For Authors</a></li>

        <li class="splitter"></li>

        <li><a href="{$baseUrl}/index.php/medj/about/contact">Help</a></li>
        
    	</ul>
    </div>
  </div>
</div>
