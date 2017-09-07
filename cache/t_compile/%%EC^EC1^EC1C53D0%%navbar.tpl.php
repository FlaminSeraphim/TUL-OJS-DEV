<?php /* Smarty version 2.6.26, created on 2017-07-19 11:04:26
         compiled from common/navbar.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'common/navbar.tpl', 23, false),array('function', 'translate', 'common/navbar.tpl', 23, false),array('function', 'call_hook', 'common/navbar.tpl', 64, false),array('modifier', 'escape', 'common/navbar.tpl', 68, false),)), $this); ?>
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
    		<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'index'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.home"), $this);?>
</a></li>
        <li class="splitter"></li>
    		<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'about'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.about"), $this);?>
</a></li>
        <li class="splitter"></li>

    		<?php if ($this->_tpl_vars['isUserLoggedIn']): ?>
    			<li><a href="<?php if ($this->_tpl_vars['hasOtherJournals']): ?><?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('journal' => 'index','page' => 'user'), $this);?>
<?php else: ?><?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'user'), $this);?>
<?php endif; ?>"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.userHome"), $this);?>
</a></li>
          <li class="splitter"></li>

    		<?php else: ?>
    			<!-- <li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'login'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.login"), $this);?>
</a></li> -->
    			<?php if (! $this->_tpl_vars['hideRegisterLink']): ?>
    				<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'user','op' => 'register'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.register"), $this);?>
</a></li>
            <li class="splitter"></li>

    			<?php endif; ?>
    		<?php endif; ?>
    		<?php if ($this->_tpl_vars['siteCategoriesEnabled']): ?>
    			<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('journal' => 'index','page' => 'search','op' => 'categories'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.categories"), $this);?>
</a></li>
          <li class="splitter"></li>

    		<?php endif; ?>


    		<?php if ($this->_tpl_vars['currentJournal'] && $this->_tpl_vars['currentJournal']->getSetting('publishingMode') != @PUBLISHING_MODE_NONE): ?>
    			<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'issue','op' => 'current'), $this);?>
">Current Issue</a></li>
          <li class="splitter"></li>

    			<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'issue','op' => 'archive'), $this);?>
">Back Issues</a></li>
          <li class="splitter"></li>

    		<?php endif; ?>

    		<?php if ($this->_tpl_vars['enableAnnouncements']): ?>
    			<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'announcement'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "announcement.announcements"), $this);?>
</a></li>
          <li class="splitter"></li>

    		<?php endif; ?>
    		<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Common::Header::Navbar::CurrentJournal"), $this);?>


    		<?php $_from = $this->_tpl_vars['navMenuItems']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['navItemKey'] => $this->_tpl_vars['navItem']):
?>
    			<?php if ($this->_tpl_vars['navItem']['url'] != '' && $this->_tpl_vars['navItem']['name'] != ''): ?>
    				<li class="navItem" id="navItem-<?php echo ((is_array($_tmp=$this->_tpl_vars['navItemKey'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
"><a href="<?php if ($this->_tpl_vars['navItem']['isAbsolute']): ?><?php echo ((is_array($_tmp=$this->_tpl_vars['navItem']['url'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
<?php else: ?><?php echo $this->_tpl_vars['baseUrl']; ?>
<?php echo ((is_array($_tmp=$this->_tpl_vars['navItem']['url'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
<?php endif; ?>"><?php if ($this->_tpl_vars['navItem']['isLiteral']): ?><?php echo ((is_array($_tmp=$this->_tpl_vars['navItem']['name'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
<?php else: ?><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => $this->_tpl_vars['navItem']['name']), $this);?>
<?php endif; ?></a></li>
            <li class="splitter"></li>

    			<?php endif; ?>
    		<?php endforeach; endif; unset($_from); ?>

        <li><a href="<?php echo $this->_tpl_vars['baseUrl']; ?>
/index.php/OSMP/notification/subscribeMailList">Subscribe</a></li>

        <li class="splitter"></li>

        <li><a href="<?php echo $this->_tpl_vars['baseUrl']; ?>
/index.php/OSMP/about/submissions">For Authors</a></li>

        <li class="splitter"></li>

        <li><a href="<?php echo $this->_tpl_vars['baseUrl']; ?>
/index.php/OSMP/about/contact">Contact Us</a></li>

        <li class="splitter"></li>

        <li><a href="<?php echo $this->_tpl_vars['baseUrl']; ?>
/index.php/index/help">Help</a></li>

    	</ul>
    </div>
  </div>
</div>