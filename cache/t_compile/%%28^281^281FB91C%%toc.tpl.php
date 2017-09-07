<?php /* Smarty version 2.6.26, created on 2017-06-12 14:13:03
         compiled from help/toc.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'help/toc.tpl', 16, false),array('function', 'translate', 'help/toc.tpl', 20, false),array('modifier', 'escape', 'help/toc.tpl', 17, false),array('modifier', 'explode', 'help/toc.tpl', 54, false),)), $this); ?>


<div style="padding-top: 0.5em;">
  <div class="row">
    <div class="col-xs-12 col-md-4">
      <form action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'search'), $this);?>
" method="post" style="display: inline">
    	<input type="text" name="keyword" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['helpSearchKeyword'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" class="textField" />&nbsp;
    </div>
    <div class="col-xs-12 col-md-8">
      <input type="submit" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.search"), $this);?>
" class="btn changeRadius marginTopSm" />
      </form>
    </div>
  </div>

</div>


<script type="text/javascript">
<?php echo '
$("#helpDropdown").click(function(){
  $("#toggleHelp").toggleClass(\'hidden\');
  $(".toggleUpArrow").toggle();
  $(".toggleDownArrow").toggle();
});
  '; ?>

</script>


<!-- scrapped code we don't need but afraid to delete. -->
      <!-- <?php if (! empty ( $this->_tpl_vars['helpSearchResult'] ) && ! empty ( $this->_tpl_vars['helpSearchKeyword'] )): ?>
      <br />

      <div><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'search','anchor' => ((is_array($_tmp="result-".($this->_tpl_vars['helpSearchResult']))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)),'keyword' => ((is_array($_tmp=$this->_tpl_vars['helpSearchKeyword'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp))), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "help.searchReturnResults"), $this);?>
</a></div>
      <?php endif; ?>

      <br />

      <div><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'toc'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "help.toc"), $this);?>
</a></div>

      <br />

      <?php if ($this->_tpl_vars['toc']->getParentTopicId() && $this->_tpl_vars['toc']->getParentTopicId() != $this->_tpl_vars['topic']->getId()): ?>
      <div id="helpContents">
      <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "help.contents"), $this);?>
&nbsp;<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'view','path' => ((is_array($_tmp=$this->_tpl_vars['toc']->getParentTopicId())) ? $this->_run_mod_handler('explode', true, $_tmp, "/") : $this->_plugins['modifier']['explode'][0][0]->smartyExplode($_tmp, "/"))), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "help.upALevel"), $this);?>
</a>
      </div>
      <br />
      <?php endif; ?> -->