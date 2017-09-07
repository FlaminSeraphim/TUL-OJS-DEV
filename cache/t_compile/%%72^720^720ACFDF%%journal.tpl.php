<?php /* Smarty version 2.6.26, created on 2017-06-12 14:09:43
         compiled from index/journal.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'call_hook', 'index/journal.tpl', 77, false),array('function', 'translate', 'index/journal.tpl', 81, false),array('function', 'url', 'index/journal.tpl', 96, false),array('modifier', 'escape', 'index/journal.tpl', 81, false),array('modifier', 'strip_unsafe_html', 'index/journal.tpl', 106, false),array('modifier', 'nl2br', 'index/journal.tpl', 106, false),)), $this); ?>


<?php echo ''; ?><?php $this->assign('pageTitleTranslated', $this->_tpl_vars['siteTitle']); ?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>

<link rel="stylesheet" href="<?php echo $this->_tpl_vars['baseUrl']; ?>
/lib/osu/osuHideSideBar.css" type="text/css" />

<div class="row">
  <p id="blurb">Oklahoma State Medical Proceedings is an online
    open access peer reviewed journal with an emphasis
    on articles by individuals in training. </p>
  <div class="col-xs-10 col-xs-offset-1">
    <div id="frontPageImage">
      <a href="<?php echo $this->_tpl_vars['baseUrl']; ?>
/index.php/OSMP/about">
        <img
          sizes="(max-width: 1400px) 100vw, 1400px"
          srcset="
          <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_200.jpg 200w,
          <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_445.jpg 445w,
          <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_626.jpg 626w,
          <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_783.jpg 783w,
          <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_909.jpg 909w,
          <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_1048.jpg 1048w,
          <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_1157.jpg 1157w,
          <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_1259.jpg 1259w,
          <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_1365.jpg 1365w,
          <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_1399.jpg 1399w,
          <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_1400.jpg 1400w"
          src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_1400.jpg"/>
        </a>
    </div>
  </div>
 </div>
<!-- <div id="frontPageImage">
  <a href="<?php echo $this->_tpl_vars['baseUrl']; ?>
/index.php/OSMP/about">
    <img
      sizes="(max-width: 1400px) 100vw, 1400px"
      srcset="
      <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_200.jpg 200w,
      <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_445.jpg 445w,
      <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_626.jpg 626w,
      <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_783.jpg 783w,
      <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_909.jpg 909w,
      <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_1048.jpg 1048w,
      <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_1157.jpg 1157w,
      <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_1259.jpg 1259w,
      <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_1365.jpg 1365w,
      <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_1399.jpg 1399w,
      <?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_1400.jpg 1400w"
      src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/public/osuImages/TANDY_uv3yxq_c_scale,w_1400.jpg"/>
    </a>
</div> -->

<div class="clear"></div>
<hr class="style-one">




  <div class="row">
     <div class="col-xs-12 col-lg-3 col-lg-offset-1">
      <?php if ($this->_tpl_vars['journalDescription']): ?>
      	<div id="journalDescription"><?php echo $this->_tpl_vars['journalDescription']; ?>
</div>
      <?php endif; ?>

      <?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Index::journal"), $this);?>


      <?php if ($this->_tpl_vars['homepageImage']): ?>
      <br />
      <div id="homepageImage"><img src="<?php echo $this->_tpl_vars['publicFilesDir']; ?>
/<?php echo ((is_array($_tmp=$this->_tpl_vars['homepageImage']['uploadName'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'url') : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp, 'url')); ?>
" width="<?php echo ((is_array($_tmp=$this->_tpl_vars['homepageImage']['width'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" height="<?php echo ((is_array($_tmp=$this->_tpl_vars['homepageImage']['height'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" <?php if ($this->_tpl_vars['homepageImageAltText'] != ''): ?>alt="<?php echo ((is_array($_tmp=$this->_tpl_vars['homepageImageAltText'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
"<?php else: ?>alt="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.journalHomepageImage.altText"), $this);?>
"<?php endif; ?> /></div>
      <?php endif; ?>

      <!-- <?php if ($this->_tpl_vars['additionalHomeContent']): ?> -->
      <br />
      <div id="additionalHomeContent"><?php echo $this->_tpl_vars['additionalHomeContent']; ?>
</div>
      <!-- <?php endif; ?> -->

      <?php if ($this->_tpl_vars['enableAnnouncementsHomepage']): ?>
      	      	<div id="announcementsHome">
      		<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "announcement.announcementsHome"), $this);?>
</h3>
      		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "announcement/list.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
      		<table class="announcementsMore">
      			<tr>
      				<td><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'announcement'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "announcement.moreAnnouncements"), $this);?>
</a></td>
      			</tr>
      		</table>
      	</div>
      <?php endif; ?>


      <?php if ($this->_tpl_vars['issue'] && $this->_tpl_vars['currentJournal']->getSetting('publishingMode') != @PUBLISHING_MODE_NONE): ?>
      	      	<br />
      	<h3 id="issueHeader"><?php echo ((is_array($_tmp=((is_array($_tmp=$this->_tpl_vars['issue']->getIssueIdentification())) ? $this->_run_mod_handler('strip_unsafe_html', true, $_tmp) : String::stripUnsafeHtml($_tmp)))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>
</h3>
      	<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "issue/currentIssue.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
      <?php endif; ?>




      <!-- <?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "issue/issue.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?> -->





    <div class="col-xs-4 col-lg-2 ">
      <div class="center-twitter">
        <a class="twitter-timeline" data-height="650" data-theme="dark" data-link-color="#FAB81E" href="https://twitter.com/MedProceedings">Tweets by MedProceedings</a> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>
        <!-- <a class="twitter-timeline" data-theme="dark" href="https://twitter.com/MedProceedings">Tweets by MedProceedings</a> <script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script> -->
      </div>
    </div>
<!-- end of row div  -->
</div>



<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>