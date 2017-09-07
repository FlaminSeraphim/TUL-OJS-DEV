<?php /* Smarty version 2.6.26, created on 2017-08-14 13:41:31
         compiled from about/submissions.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'about/submissions.tpl', 26, false),array('function', 'translate', 'about/submissions.tpl', 26, false),array('modifier', 'escape', 'about/submissions.tpl', 37, false),array('modifier', 'nl2br', 'about/submissions.tpl', 55, false),array('modifier', 'string_format', 'about/submissions.tpl', 95, false),)), $this); ?>
<?php echo ''; ?><?php $this->assign('pageTitle', "about.submissions"); ?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>

<link rel="stylesheet" href="<?php echo $this->_tpl_vars['baseUrl']; ?>
/lib/osu/osuHideSideBar.css" type="text/css">
<link rel="stylesheet" href="<?php echo $this->_tpl_vars['baseUrl']; ?>
/lib/osu/miniHeader.css" type="text/css" />
<div class="row">
  <div class="col-md-8 col-md-offset-2">

    <?php if ($this->_tpl_vars['currentJournal']->getSetting('journalPaymentsEnabled') && ( $this->_tpl_vars['currentJournal']->getSetting('submissionFeeEnabled') || $this->_tpl_vars['currentJournal']->getSetting('fastTrackFeeEnabled') || $this->_tpl_vars['currentJournal']->getSetting('publicationFeeEnabled') )): ?>
    	<?php $this->assign('authorFees', 1); ?>
    <?php endif; ?>

    <ul class="miniHeader">
    	<li id="linkDisableUserReg"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'about','op' => 'submissions','anchor' => 'onlineSubmissions'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.onlineSubmissions"), $this);?>
</a></li>
    	<?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('authorGuidelines') != ''): ?><li id="linkAuthorGuidelines"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'about','op' => 'submissions','anchor' => 'authorGuidelines'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.authorGuidelines"), $this);?>
</a></li><?php endif; ?>
    	<?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('copyrightNotice') != ''): ?><li id="linkCopyrightNotice"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'about','op' => 'submissions','anchor' => 'copyrightNotice'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.copyrightNotice"), $this);?>
</a></li><?php endif; ?>
    	<?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('privacyStatement') != ''): ?><li id="linkPrivacyStatement"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'about','op' => 'submissions','anchor' => 'privacyStatement'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.privacyStatement"), $this);?>
</a></li><?php endif; ?>
    	<li><a href="<?php echo $this->_tpl_vars['baseUrl']; ?>
/index.php/OSMP/about/editorialPolicies#sectionPoliciess">Section Specific Guidelines</a></li>
    	<?php if ($this->_tpl_vars['authorFees']): ?><li id="linkAuthorFees"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'about','op' => 'submissions','anchor' => 'authorFees'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.authorFees"), $this);?>
</a></li><?php endif; ?>
    </ul>

    <div id="onlineSubmissions">
    	<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.onlineSubmissions"), $this);?>
</h3>
    	<p>
    		<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.onlineSubmissions.haveAccount",'journalTitle' => ((is_array($_tmp=$this->_tpl_vars['siteTitle'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp))), $this);?>
<br />
    		<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'login'), $this);?>
" class="action"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.onlineSubmissions.login"), $this);?>
</a>
    	</p>
    	<?php if (! $this->_tpl_vars['currentJournal']->getSetting('disableUserReg')): ?>
    		<p>
    			<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.onlineSubmissions.needAccount"), $this);?>
<br />
    			<a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'user','op' => 'register'), $this);?>
" class="action"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.onlineSubmissions.registration"), $this);?>
</a>
    		</p>
    		<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.onlineSubmissions.registrationRequired"), $this);?>
</p>
    	<?php endif; ?>
      <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('journal' => $this->_tpl_vars['journalPath'],'page' => 'author','op' => 'submit'), $this);?>
" class="make-bigger-and-orange">Click Here to start a new submission</a>
    </div>

    <div class="separator">&nbsp;</div>

    <?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('authorGuidelines') != ''): ?>
    <h3 id="authorGuidelines"> <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.authorGuidelines"), $this);?>
 <i class="fa fa-arrow-circle-down toggleDownAuthorArrow" aria-hidden="true"></i> <i class="fa fa-arrow-circle-up toggleUpAuthorArrow hidden" aria-hidden="true"></i></h3>
      <div id="author" class="hidden">
        <p><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('authorGuidelines'))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>
</p>
      </div>

    <div class="separator">&nbsp;</div>
    <?php endif; ?>

    <?php if ($this->_tpl_vars['submissionChecklist']): ?>
    	<div id="submissionPreparationChecklist"><h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.submissionPreparationChecklist"), $this);?>
</h3>
    	<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.submissionPreparationChecklist.description"), $this);?>
</p>
    	<ol>
    		<?php $_from = $this->_tpl_vars['submissionChecklist']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['checklistItem']):
?>
    			<li><?php echo ((is_array($_tmp=$this->_tpl_vars['checklistItem']['content'])) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>
</li>
    		<?php endforeach; endif; unset($_from); ?>
    	</ol>
    	<div class="separator">&nbsp;</div>
    	</div>
    <?php endif; ?>
    <?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('copyrightNotice') != ''): ?>
    <div id="copyrightNotice">
      <h3 id="hideSection1"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.copyrightNotice"), $this);?>
 (click arrow for more details) <i class="fa fa-arrow-circle-down toggleDownArrow1" aria-hidden="true"></i> <i class="fa fa-arrow-circle-up toggleUpArrow1 hidden" aria-hidden="true"></i></h3>
      <div id="section1" class="hidden">
          <p><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('copyrightNotice'))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>
</p>
      </div>
    <div class="separator">&nbsp;</div>
    </div>
    <?php endif; ?>

    <?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('privacyStatement') != ''): ?><div id="privacyStatement"><h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.privacyStatement"), $this);?>
</h3>
    <p><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('privacyStatement'))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>
</p>

    <div class="separator">&nbsp;</div>
    </div>
    <?php endif; ?>

    <?php if ($this->_tpl_vars['authorFees']): ?>

    <div id="authorFees"><h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.payment.authorFees"), $this);?>
</h3>
    	<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "about.authorFeesMessage"), $this);?>
</p>
    	<?php if ($this->_tpl_vars['currentJournal']->getSetting('submissionFeeEnabled')): ?>
    		<p><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('submissionFeeName'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
: <?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getSetting('submissionFee'))) ? $this->_run_mod_handler('string_format', true, $_tmp, "%.2f") : smarty_modifier_string_format($_tmp, "%.2f")); ?>
 (<?php echo $this->_tpl_vars['currentJournal']->getSetting('currency'); ?>
)<br />
    		<?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('submissionFeeDescription'))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>
<p>
    	<?php endif; ?>
    	<?php if ($this->_tpl_vars['currentJournal']->getSetting('fastTrackFeeEnabled')): ?>
    		<p><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('fastTrackFeeName'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
: <?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getSetting('fastTrackFee'))) ? $this->_run_mod_handler('string_format', true, $_tmp, "%.2f") : smarty_modifier_string_format($_tmp, "%.2f")); ?>
 (<?php echo $this->_tpl_vars['currentJournal']->getSetting('currency'); ?>
)<br />
    		<?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('fastTrackFeeDescription'))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>
<p>
    	<?php endif; ?>
    	<?php if ($this->_tpl_vars['currentJournal']->getSetting('publicationFeeEnabled')): ?>
    		<p><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('publicationFeeName'))) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
: <?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getSetting('publicationFee'))) ? $this->_run_mod_handler('string_format', true, $_tmp, "%.2f") : smarty_modifier_string_format($_tmp, "%.2f")); ?>
 (<?php echo $this->_tpl_vars['currentJournal']->getSetting('currency'); ?>
)<br />
    		<?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('publicationFeeDescription'))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>
<p>
    	<?php endif; ?>
    	<?php if ($this->_tpl_vars['currentJournal']->getLocalizedSetting('waiverPolicy') != ''): ?>
    		<p><?php echo ((is_array($_tmp=$this->_tpl_vars['currentJournal']->getLocalizedSetting('waiverPolicy'))) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>
</p>
    	<?php endif; ?>
    </div>
    <?php endif; ?>
  </div>
</div>


<script type="text/javascript">
var sectionCounterNum = <?php echo $this->_tpl_vars['sectionCounter']; ?>

<?php echo '
//console.log(sectionCounterNum);
// for(i = 0; i <= sectionCounterNum; i++){
//   var hide = "#hideSection" + i;
//   var section = "#section" + i;
//   console.log(hide + " " + section);
//   $(hide).on("click", section, function(sect){
//     $(section).toggleClass("hidden");
//     $(".toggleUpArrow" + i).toggle();
//     $(".toggleDownArrow" + i).toggle();
//   });
// }
// $("#hideSection2").on("click", function(){
//   $("#section2").toggleClass("hidden");
//
// })
$("#hideSection1").click(function(){
  $("#section1").toggleClass("hidden");
  $(".toggleUpArrow1").toggleClass("hidden");
  $(".toggleDownArrow1").toggleClass("hidden");
 })

$("#hideSection2").click(function(){
  $("#section2").toggleClass("hidden");
  $(".toggleUpArrow2").toggleClass("hidden");
  $(".toggleDownArrow2").toggleClass("hidden");
 })

 $("#hideSection3").click(function(){
   $("#section3").toggleClass("hidden");
   $(".toggleUpArrow3").toggleClass("hidden");
   $(".toggleDownArrow3").toggleClass("hidden");
  })

  $("#hideSection4").click(function(){
    $("#section4").toggleClass("hidden");
    $(".toggleUpArrow4").toggleClass("hidden");
    $(".toggleDownArrow4").toggleClass("hidden");
   })

   $("#hideSection5").click(function(){
     $("#section5").toggleClass("hidden");
     $(".toggleUpArrow5").toggleClass("hidden");
     $(".toggleDownArrow5").toggleClass("hidden");
    })

    $("#hideSection6").click(function(){
      $("#section6").toggleClass("hidden");
      $(".toggleUpArrow6").toggleClass("hidden");
      $(".toggleDownArrow6").toggleClass("hidden");
     })

     $("#hideSection7").click(function(){
       $("#section7").toggleClass("hidden");
       $(".toggleUpArrow7").toggleClass("hidden");
       $(".toggleDownArrow7").toggleClass("hidden");
      })

      $("#hideSection8").click(function(){
        $("#section8").toggleClass("hidden");
        $(".toggleUpArrow8").toggleClass("hidden");
        $(".toggleDownArrow8").toggleClass("hidden");
       })

       $("#hideSection9").click(function(){
         $("#section9").toggleClass("hidden");
         $(".toggleUpArrow9").toggleClass("hidden");
         $(".toggleDownArrow9").toggleClass("hidden");
        })

        $("#hideSection10").click(function(){
          $("#section10").toggleClass("hidden");
          $(".toggleUpArrow10").toggleClass("hidden");
          $(".toggleDownArrow10").toggleClass("hidden");
         })

         $("#hideSection11").click(function(){
           $("#section11").toggleClass("hidden");
           $(".toggleUpArrow11").toggleClass("hidden");
           $(".toggleDownArrow11").toggleClass("hidden");
          })

          $("#hideSection12").click(function(){
            $("#section12").toggleClass("hidden");
            $(".toggleUpArrow12").toggleClass("hidden");
            $(".toggleDownArrow12").toggleClass("hidden");
           })

           $("#hideSection13").click(function(){
             $("#section13").toggleClass("hidden");
             $(".toggleUpArrow13").toggleClass("hidden");
             $(".toggleDownArrow13").toggleClass("hidden");
            })

            $("#hideSection14").click(function(){
              $("#section14").toggleClass("hidden");
              $(".toggleUpArrow14").toggleClass("hidden");
              $(".toggleDownArrow14").toggleClass("hidden");
             })

             $("#hideSection15").click(function(){
               $("#section15").toggleClass("hidden");
               $(".toggleUpArrow15").toggleClass("hidden");
               $(".toggleDownArrow15").toggleClass("hidden");
             })

              $("#authorGuidelines").click(function(){
                $("#author").toggleClass("hidden");
                $(".toggleUpAuthorArrow").toggleClass("hidden");
                $(".toggleDownAuthorArrow").toggleClass("hidden");
               })
'; ?>

</script>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>