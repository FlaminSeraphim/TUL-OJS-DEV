<?php /* Smarty version 2.6.26, created on 2017-08-02 14:19:39
         compiled from user/register.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'url', 'user/register.tpl', 19, false),array('function', 'translate', 'user/register.tpl', 19, false),array('function', 'fieldLabel', 'user/register.tpl', 59, false),array('function', 'form_language_chooser', 'user/register.tpl', 62, false),array('function', 'html_options_translate', 'user/register.tpl', 124, false),array('function', 'html_options', 'user/register.tpl', 407, false),array('modifier', 'assign', 'user/register.tpl', 30, false),array('modifier', 'escape', 'user/register.tpl', 52, false),array('modifier', 'nl2br', 'user/register.tpl', 437, false),)), $this); ?>
<?php echo ''; ?><?php $this->assign('pageTitle', "user.register"); ?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>

<link rel="stylesheet" href="<?php echo $this->_tpl_vars['baseUrl']; ?>
/lib/osu/osuHideSideBar.css" type="text/css">
<link rel="stylesheet" href="<?php echo $this->_tpl_vars['baseUrl']; ?>
/lib/osu/regform.css" type="text/css">

<?php if ($this->_tpl_vars['implicitAuth'] === true && ! Validation ::isLoggedIn()): ?>
	<p><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'login','op' => 'implicitAuthLogin'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.implicitAuth"), $this);?>
</a></p>
<?php else: ?>

<div class="row">
  <div class="col-md-8 col-md-offset-2">
    <form id="registerForm" method="post" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'registerUser'), $this);?>
">

  	<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.completeForm"), $this);?>
</p>

  	<?php if (! $this->_tpl_vars['implicitAuth'] || ( $this->_tpl_vars['implicitAuth'] === @IMPLICIT_AUTH_OPTIONAL && ! Validation ::isLoggedIn())): ?>
  		<?php if (! $this->_tpl_vars['existingUser']): ?>
  			<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'user','op' => 'register','existingUser' => 1), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'url') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'url'));?>

  			<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.alreadyRegisteredOtherJournal",'registerUrl' => $this->_tpl_vars['url']), $this);?>
</p>
  		<?php else: ?>
  			<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'user','op' => 'register'), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'url') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'url'));?>

  			<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.notAlreadyRegisteredOtherJournal",'registerUrl' => $this->_tpl_vars['url']), $this);?>
</p>
  			<input type="hidden" name="existingUser" value="1"/>
  		<?php endif; ?>

  		<?php if ($this->_tpl_vars['implicitAuth'] === @IMPLICIT_AUTH_OPTIONAL): ?>
  			<p><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'login','op' => 'implicitAuthLogin'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.implicitAuth"), $this);?>
</a></p>
  		<?php endif; ?>

  		<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.profile"), $this);?>
</h3>

  		<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/formErrors.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>

  		<?php if ($this->_tpl_vars['existingUser']): ?>
  			<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.loginToRegister"), $this);?>
</p>
  		<?php endif; ?>
  	<?php endif; ?>
  	<?php if ($this->_tpl_vars['source']): ?>
  		<input type="hidden" name="source" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['source'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" />
  	<?php endif; ?>
  <?php endif; ?>
    <table class="data" width="">
    <?php if (count ( $this->_tpl_vars['formLocales'] ) > 1 && ! $this->_tpl_vars['existingUser']): ?>
    	<tr valign="top">
    		<td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'formLocale','key' => "form.formLanguage"), $this);?>
</td>
    		<td width="80%" class="value">
    			<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'user','op' => 'register','escape' => false), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'userRegisterUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'userRegisterUrl'));?>

    			<?php echo $this->_plugins['function']['form_language_chooser'][0][0]->smartyFormLanguageChooser(array('form' => 'registerForm','url' => $this->_tpl_vars['userRegisterUrl']), $this);?>

    			<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "form.formLanguage.description"), $this);?>
</span>
    		</td>
    	</tr>
    </table>
    <?php endif; ?>    <div class="row">
      <div class="col-xs-12 col-md-4">

        <?php if (! $this->_tpl_vars['implicitAuth'] || ( $this->_tpl_vars['implicitAuth'] === @IMPLICIT_AUTH_OPTIONAL && ! Validation ::isLoggedIn())): ?>
        	<!-- <tr valign="top"> -->
        		<!-- <td width="20%" class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'username','required' => 'true','key' => "user.username"), $this);?>
</td> -->
        		<!-- <td width="" class="value"> --> <span class="underlineForm"><input type="text" name="username" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['username'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" id="username" class="username" size="20" maxlength="32" class="textField" placeholder="Username*"/> </span><!--</td>-->
        	<!-- </tr> -->
        	<?php if (! $this->_tpl_vars['existingUser']): ?>
        	<!-- <tr valign="top"> -->
        		<!-- <td></td> -->
        		<!-- <td class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.usernameRestriction"), $this);?>
</td> -->
        	<!-- </tr> -->
        	<?php endif; ?>          <label class="important" for="password">Password</label> <input type="text" class="required hds" >

      </div>
      <div class="col-xs-12 col-md-4">

            	<!-- <tr valign="top"> -->
            		<!-- <td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'password','required' => 'true','key' => "user.password"), $this);?>
</td> -->
            		<!-- <td class="value"> --> <span class="underlineForm"><input type="password" name="password" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['password'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" id="password" size="20" class="textField" placeholder="Password at least 6 Char*" /> </span><span class="underlineForm"><!--</td>-->
            	<!-- </tr> -->
      </div>
      <div class="col-xs-12 col-md-4">
        <?php if (! $this->_tpl_vars['existingUser']): ?>
          <!-- <tr valign="top">
            <td></td> -->
            <!-- <td class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.passwordLengthRestriction",'length' => $this->_tpl_vars['minPasswordLength']), $this);?>
</td> -->
          <!-- </tr> -->
          <!-- <tr valign="top"> -->
            <!-- <td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'password2','required' => 'true','key' => "user.repeatPassword"), $this);?>
</td> -->
            <!-- <td class="value"> --><span class="underlineForm"><input type="password" name="password2" id="password2" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['password2'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="20" class="textField" placeholder="Repeat Password" /></span><!-- </td>-->
          <!-- </tr> -->
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12 col-md-4">
        <!-- <tr valign="top"> -->
    			<!-- <td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'firstName','required' => 'true','key' => "user.firstName"), $this);?>
</td> -->
    			<!-- <td class="value">--><span class="underlineForm"><input type="text" id="firstName" name="firstName" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['firstName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="20" maxlength="40" class="textField" placeholder="First Name*" /></span><!-- </td>-->
    		<!-- </tr> -->

      </div>
      <div class="col-xs-12 col-md-4">
        <!-- <tr valign="top"> -->
          <!-- <td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'lastName','required' => 'true','key' => "user.lastName"), $this);?>
</td> -->
          <!-- <td class="value">--><span class="underlineForm"><input type="text" id="lastName" name="lastName" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['lastName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="20" maxlength="90" class="textField" placeholder="Last Name*" /></span><!-- </td>-->
        <!-- </tr> -->
      </div>
      <div class="col-xs-12 col-md-4">
        <!-- <tr valign="top"> -->
    			<!-- <td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => "gender-m",'key' => "user.gender"), $this);?>
</td> -->
    			<!-- <td class="value"> -->
    				<span class="underlineForm"><select name="gender" id="gender" size="1" class="selectMenu" placeholder="gender*">
              <option class="makeLighter">Gender</option>
    					<?php echo $this->_plugins['function']['html_options_translate'][0][0]->smartyHtmlOptionsTranslate(array('options' => $this->_tpl_vars['genderOptions'],'selected' => $this->_tpl_vars['gender']), $this);?>

    				</select></span>
    			<!-- </td> -->
    		<!-- </tr> -->
      </div>
    </div>
    <div class="row">
      <div id="affParentDropDown" class="col-xs-12 col-md-8">
        <!-- <tr valign="top"> -->
    			<!-- <td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'affiliation','key' => "user.affiliation"), $this);?>
</td> -->
    			<!-- <td class="value"> -->
            <!-- <span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.affiliation.description"), $this);?>
</span> -->
            <span class="underlineForm"><select id="affDropDown"  >
              <option>School Affiliation List</option>
              <option class="pickedOption">Alabama College of Osteopathic Medicine
              (ACOM)</option>
              <option class="pickedOption">Arizona College of Osteopathic Medicine
              of Midwestern University (AZCOM/MWU)</option>
              <option class="pickedOption">Des Moines University College of
              Osteopathic Medicine (DMU-COM)</option>
              <option class="pickedOption">Arkansas College of Osteopathic Medicine
              (ARCOM)</option>
              <option class="pickedOption">Burrell College of Osteopathic Medicine
              (BCOM)</option>
              <option class="pickedOption">Kansas City University of Medicine and
              Biosciences College of Osteopathic Medicine
              (KCU-COM)</option>
              <option class="pickedOption">A.T. Still University–Kirksville College
              of Osteopathic Medicine (ATSU-KCOM)</option>
              <option class="pickedOption">Campbell University Jerry M. Wallace School
              of Osteopathic Medicine (CUSOM)</option>
              <option class="pickedOption">Lake Erie College of Osteopathic Medicine
              (LECOM)</option>
              <option class="pickedOption">A.T. Still University–School of Osteopathic
              Medicine in Arizona (ATSU-SOMA)</option>
              <option class="pickedOption">Chicago College of Osteopathic Medicine
              of Midwestern University (CCOM/MWU)</option>
              <option class="pickedOption">Lake Erie College of Osteopathic Medicine
              Bradenton Campus (LECOM Bradenton)</option>
              <option class="pickedOption">Liberty University College of
              Osteopathic Medicine (LUCOM)</option>
              <option class="pickedOption">Pacific Northwest University of Health Sciences
              College of Osteopathic Medicine (PNWU-COM)</option>
              <option class="pickedOption">University of New England College
              of Osteopathic Medicine (UNECOM)</option>
              <option class="pickedOption">Lincoln Memorial University–DeBusk College
              of Osteopathic Medicine (LMU-DCOM)</option>
              <option class="pickedOption">Philadelphia College of Osteopathic Medicine
              (PCOM)</option>
              <option class="pickedOption">University of North Texas Health Science Center
              at Fort Worth/Texas College of Osteopathic
              Medicine (UNTHSC/TCOM)</option>
              <option class="pickedOption">Marian University College of
              Osteopathic Medicine (MU-COM)</option>
              <option class="pickedOption">Georgia Campus–Philadelphia College
              of Osteopathic Medicine (GA-PCOM)</option>
              <option class="pickedOption">University of Pikeville–Kentucky College
              of Osteopathic Medicine (UP-KYCOM)</option>
              <option class="pickedOption">Michigan State University College
              of Osteopathic Medicine (MSUCOM)</option>
              <option class="pickedOption">Rocky Vista University College
              of Osteopathic Medicine (RVUCOM)</option>
              <option class="pickedOption">Edward Via College of Osteopathic Medicine–
              Auburn Campus (VCOM-Auburn)</option>
              <option class="pickedOption">New York Institute of Technology College
              of Osteopathic Medicine (NYITCOM)</option>
              <option class="pickedOption">Rowan University School of Osteopathic
              Medicine (RowanSOM)</option>Edward Via College of Osteopathic Medicine–
              Carolinas Campus (VCOM-CC)</option>
              <option class="pickedOption">New York Institute of Technology College
              of Osteopathic Medicine (NYITCOM)</option>
              <option class="pickedOption">Rowan University School of Osteopathic
              Medicine (RowanSOM)</option>
              <option class="pickedOption">Edward Via College of Osteopathic Medicine–
              Carolinas Campus (VCOM-CC)</option>
              <option class="pickedOption">Nova Southeastern University College
              of Osteopathic Medicine (NSU-COM)</option>
              <option class="pickedOption">Touro College of Osteopathic Medicine–
              New York (TouroCOM-NY)</option>
              <option class="pickedOption">Edward Via College of Osteopathic Medicine–
              Virginia Campus (VCOM-VC)</option>
              <option class="pickedOption">Ohio University Heritage College of
              Osteopathic Medicine (OU-HCOM)</option>
              <option class="pickedOption">Touro University College of Osteopathic
              Medicine–California (TUCOM-CA)</option>
              <option class="pickedOption">West Virginia School of Osteopathic
              Medicine (WVSOM)</option>
              <option class="pickedOption">Oklahoma State University Center for Health
              Sciences College of Osteopathic Medicine
              (OSU-COM)</option>
              <option class="pickedOption">Touro University Nevada College
              of Osteopathic Medicine (TUNCOM)</option>
              <option class="pickedOption">Western University of Health Sciences/
              College of Osteopathic Medicine of the Pacific
              (Western U/COMP)</option>
              <option class="pickedOption">University of Incarnate Word School of
              Osteopathic Medicine (UIWSOM)</option>
              <option class="pickedOption">William Carey University College of
              Osteopathic Medicine (WCUCOM)</option>

            </select></span>
    			<!-- </td>
    		</tr> -->
      </div>
      <div class="col-xs-12 col-md-4">
        <span class="underlineForm"><textarea id="affiliation" name="affiliation[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" rows="2" cols="40" class="textArea" placeholder="School Affiliation (if not in list)*" ><?php echo ((is_array($_tmp=$this->_tpl_vars['affiliation'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea></span>
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12 col-md-4">
        <!-- <tr valign="top"> -->
    			 <!-- <td class="label">Rank<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'signature','key' => "user.signature"), $this);?>
</td> -->
    			<!-- <td class="value"> -->
            <span class="underlineForm"><select id="signature" class="" name="signature[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]">
              <option>Rank</option>
              <option>MS I</option>
              <option>MS II</option>
              <option>MS III</option>
              <option>MS IV</option>
              <option>PGY I</option>
              <option>PGY II</option>
              <option>PGY III</option>
              <option>PGY IV</option>
              <option>PGY V</option>
              <option>PGY VI+</option>
              <option>Fellow</option>
              <option>Assistant Professor</option>
              <option>Associate Professor</option>
              <option>Full Professor</option>
              <option>Graduate Student</option>
              <option>Undergraduate Student</option>
            </select></span>
            <!-- <textarea name="" id="signature" rows="" cols="40" class="textArea"><?php echo ((is_array($_tmp=$this->_tpl_vars['signature'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea>--></td>
    		<!-- </tr> -->
      </div>
      <div class="col-xs-12 col-md-4">
        <!-- <tr valign="top"> -->
    			<!-- <td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'email','required' => 'true','key' => "user.email"), $this);?>
</td> -->
    			<!-- <td class="value">--><span class="underlineForm"><input type="text" id="email" name="email" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['email'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="90" class="textField" placeholder="Email*" /></span> <!-- <?php if ($this->_tpl_vars['privacyStatement']): ?><a class="action" href="#privacyStatement"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.privacyStatement"), $this);?>
--></a><?php endif; ?><!-- </td>-->
    		<!-- </tr> -->
      </div>
      <div class="col-xs-12 col-md-4">
        <!-- <tr valign="top"> -->
    			<!-- <td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'confirmEmail','required' => 'true','key' => "user.confirmEmail"), $this);?>
</td> -->
    			<!-- <td class="value">--><span class="underlineForm"><input type="text" id="confirmEmail" name="confirmEmail" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['confirmEmail'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="90" class="textField" placeholder="Confirm Email*" /></span><!-- </td>-->
    		<!-- </tr> -->
      </div>
    </div>
    <div class="row">
      <div class="col-xs-12 col-md-6 hidden">
        <!-- <tr valign="top"> -->
          <!-- <td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'orcid','key' => "user.orcid"), $this);?>
</td> -->
          <!-- <td class="value">--><span class="underlineForm"><input type="text" id="orcid" name="orcid" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['orcid'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="40" maxlength="255" class="textField" placeholder="ORCID ID (Click Here for more info)" /><span id="orcidDesc"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.orcid.description"), $this);?>
</span></span><!-- </td>-->
        <!-- </tr> -->
      </div>
      <div class="col-xs-12 col-md-6">
        <!-- <tr valign="top"> -->
    			<!-- <td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'phone','key' => "user.phone"), $this);?>
</td> -->
    			<!-- <td class="value">--><span class="underlineForm"><input type="text" name="phone" id="phone" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['phone'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="15" maxlength="24" class="textField" placeholder="Phone" /></span><!-- </td>-->
    		<!-- </tr> -->
      </div>

        <!-- <tr valign="top"> -->
    			<!-- <td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'biography','key' => "user.biography"), $this);?>
<br /><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.biography.description"), $this);?>
</td> -->
    			<!-- <td class="value"><span class="underlineForm"><input type="text" name="biography[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" placeholder="Biography Statement"></span>-->
          <!-- <textarea name="biography[<?php echo ((is_array($_tmp=$this->_tpl_vars['formLocale'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
]" id="biography" rows="5" cols="40" class="textArea" placeholder="Bio Statement" ><?php echo ((is_array($_tmp=$this->_tpl_vars['biography'][$this->_tpl_vars['formLocale']])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea></td>-->
    		<!-- </tr> -->

    </div>
    <div class="row">
      <div class="col-xs-12 col-md-12" id="regCheckBoxes">
        <!-- <tr valign="top"> -->
    			<!-- <td class="label"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'sendPassword','key' => "user.sendPassword"), $this);?>
</td> -->
    			<!-- <td class="value"> -->
    				<input type="checkbox" name="sendPassword" id="sendPassword" value="1"<?php if ($this->_tpl_vars['sendPassword']): ?> checked="checked"<?php endif; ?> /> <label for="sendPassword"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.sendPassword.description"), $this);?>
</label>
    			<!-- </td> -->
    		<!-- </tr> -->
        <?php if (! $this->_tpl_vars['implicitAuth'] || $this->_tpl_vars['implicitAuth'] === @IMPLICIT_AUTH_OPTIONAL || ( $this->_tpl_vars['implicitAuth'] === true && Validation ::isLoggedIn())): ?>
        	<?php if ($this->_tpl_vars['allowRegReader'] || $this->_tpl_vars['allowRegReader'] === null || $this->_tpl_vars['allowRegAuthor'] || $this->_tpl_vars['allowRegAuthor'] === null || $this->_tpl_vars['allowRegReviewer'] || $this->_tpl_vars['allowRegReviewer'] === null || ( $this->_tpl_vars['currentJournal'] && $this->_tpl_vars['currentJournal']->getSetting('publishingMode') == @PUBLISHING_MODE_SUBSCRIPTION && $this->_tpl_vars['enableOpenAccessNotification'] )): ?>
        		<!-- <tr valign="top"> -->
        			<!-- <td class="label">--><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('suppressId' => 'true','name' => 'registerAs','key' => "user.register.registerAs"), $this);?>
<!-- </td>-->
        			<!-- <td class="value">--><?php if ($this->_tpl_vars['allowRegReader'] || $this->_tpl_vars['allowRegReader'] === null): ?><input type="checkbox" name="registerAsReader" id="registerAsReader" value="1"<?php if ($this->_tpl_vars['registerAsReader']): ?> checked="checked"<?php endif; ?> /> <label for="registerAsReader"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.role.reader"), $this);?>
</label>: <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.readerDescription"), $this);?>
<br /><?php endif; ?>
        			<?php if ($this->_tpl_vars['currentJournal'] && $this->_tpl_vars['currentJournal']->getSetting('publishingMode') == @PUBLISHING_MODE_SUBSCRIPTION && $this->_tpl_vars['enableOpenAccessNotification']): ?><input type="checkbox" name="openAccessNotification" id="openAccessNotification" value="1"<?php if ($this->_tpl_vars['openAccessNotification']): ?> checked="checked"<?php endif; ?> /> <label for="openAccessNotification"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.role.reader"), $this);?>
</label>: <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.openAccessNotificationDescription"), $this);?>
<br /><?php endif; ?>
        			<?php if ($this->_tpl_vars['allowRegAuthor'] || $this->_tpl_vars['allowRegAuthor'] === null): ?> <br> <input type="checkbox" name="registerAsAuthor" id="registerAsAuthor" value="1"<?php if ($this->_tpl_vars['registerAsAuthor']): ?> checked="checked"<?php endif; ?> /> <label for="registerAsAuthor"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.role.author"), $this);?>
</label>: <?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.authorDescription"), $this);?>
<br /><?php endif; ?>
        			<?php if ($this->_tpl_vars['allowRegReviewer'] || $this->_tpl_vars['allowRegReviewer'] === null): ?><input type="checkbox" name="registerAsReviewer" id="registerAsReviewer" value="1"<?php if ($this->_tpl_vars['registerAsReviewer']): ?> checked="checked"<?php endif; ?> /> <label for="registerAsReviewer"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.role.reviewer"), $this);?>
</label>: <?php if ($this->_tpl_vars['existingUser']): ?><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.reviewerDescriptionNoInterests"), $this);?>
<?php else: ?><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.reviewerDescription"), $this);?>
<?php endif; ?>
        			<br /><div id="reviewerInterestsContainer" class="hidden" style="margin-left:25px;">
        				<label class="desc hidden"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.reviewerInterests"), $this);?>
</label>
        				<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "form/interestsInput.tpl", 'smarty_include_vars' => array('FBV_interestsKeywords' => $this->_tpl_vars['interestsKeywords'],'FBV_interestsTextOnly' => $this->_tpl_vars['interestsTextOnly'])));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>
        			</div>
        			<!-- </td> -->
        			<?php endif; ?>
        		<!-- </tr> -->
        	<?php endif; ?>
      </div>
      <!-- <div class="col-xs-12 col-md-4">

      </div>
      <div class="col-xs-12 col-md-4">

      </div> -->
    </div>
    <div class="row">
      <div class="col-xs-12 col-md-12">
        <?php endif; ?>          <!-- </table> -->
          <!-- <br /> -->
          <input type="submit" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register"), $this);?>
" class="btn btn-block" id="regSubmitBtn" /> <!-- <input type="button" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.cancel"), $this);?>
" class="button" onclick="document.location.href='<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'index','escape' => false), $this);?>
'" />-->
        <?php endif; ?>      </div>

    </div>

<table>


    		<?php if ($this->_tpl_vars['captchaEnabled']): ?>
    			<tr>
    				<?php if ($this->_tpl_vars['reCaptchaEnabled']): ?>
    				<td class="label" valign="top"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'recaptcha_challenge_field','required' => 'true','key' => "common.captchaField"), $this);?>
</td>
    				<td class="value">
    					<?php echo $this->_tpl_vars['reCaptchaHtml']; ?>

    				</td>
    				<?php else: ?>
    				<td class="label" valign="top"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'captcha','required' => 'true','key' => "common.captchaField"), $this);?>
</td>
    				<td class="value">
    					<img src="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'user','op' => 'viewCaptcha','path' => $this->_tpl_vars['captchaId']), $this);?>
" alt="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.captchaField.altText"), $this);?>
" /><br />
    					<span class="instruct"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.captchaField.description"), $this);?>
</span><br />
    					<input name="captcha" id="captcha" value="" size="20" maxlength="32" class="textField" />
    					<input type="hidden" name="captchaId" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['captchaId'])) ? $this->_run_mod_handler('escape', true, $_tmp, 'quoted') : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp, 'quoted')); ?>
" />
    				</td>
    				<?php endif; ?>
    			</tr>
    		<?php endif; ?>
    		<tr valign="top hidden">
    			<td class="label hidden"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'salutation','key' => "user.salutation"), $this);?>
</td>
    			<td class="value hidden"><input type="text" name="salutation" id="salutation" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['salutation'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="20" maxlength="40" class="textField" /></td>
    		</tr>

    		<tr valign="top hiden">
    			<td class="label hidden"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'middleName','key' => "user.middleName"), $this);?>
</td>
    			<td class="value hidden"><input type="text" id="middleName" name="middleName" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['middleName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="20" maxlength="40" class="textField"  /></td>
    		</tr>



    		<tr valign="top hidden">
    			<td class="label hidden"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'initials','key' => "user.initials"), $this);?>
</td>
    			<td class="value hidden"><input type="text" id="initials" name="initials" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['initials'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="5" maxlength="5" class="textField" />&nbsp;&nbsp;<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.initialsExample"), $this);?>
</td>
    		</tr>











    		<tr valign="top hidden">
    			<td class="label hidden"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'userUrl','key' => "user.url"), $this);?>
</td>
    			<td class="value hidden"><input type="text" id="userUrl" name="userUrl" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['userUrl'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="30" maxlength="255" class="textField" /></td>
    		</tr>



    		<tr valign="top hidden">
    			<td class="label hidden"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'fax','key' => "user.fax"), $this);?>
</td>
    			<td class="value hidden"><input type="text" name="fax" id="fax" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['fax'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" size="15" maxlength="24" class="textField" /></td>
    		</tr>

    		<tr valign="top hidden">
    			<td class="label hidden"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'mailingAddress','key' => "common.mailingAddress"), $this);?>
</td>
    			<td class="value hidden"><textarea name="mailingAddress" id="mailingAddress" rows="3" cols="40" class="textArea"><?php echo ((is_array($_tmp=$this->_tpl_vars['mailingAddress'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</textarea></td>
    		</tr>

    		<tr valign="top hidden">
    			<td class="label hidden"><?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'country','key' => "common.country"), $this);?>
</td>
    			<td class="value hidden">
    				<select name="country" id="country" class="selectMenu">
    					<option value=""></option>
    					<?php echo smarty_function_html_options(array('options' => $this->_tpl_vars['countries'],'selected' => $this->_tpl_vars['country']), $this);?>

    				</select>
    			</td>
    		</tr>





    		<?php if (count ( $this->_tpl_vars['availableLocales'] ) > 1): ?>
    			<tr valign="top">
    				<td class="label"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.workingLanguages"), $this);?>
</td>
    				<td class="value"><?php $_from = $this->_tpl_vars['availableLocales']; if (!is_array($_from) && !is_object($_from)) { settype($_from, 'array'); }if (count($_from)):
    foreach ($_from as $this->_tpl_vars['localeKey'] => $this->_tpl_vars['localeName']):
?>
    				<input type="checkbox" name="userLocales[]" id="userLocales-<?php echo ((is_array($_tmp=$this->_tpl_vars['localeKey'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
" value="<?php echo ((is_array($_tmp=$this->_tpl_vars['localeKey'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
"<?php if (in_array ( $this->_tpl_vars['localeKey'] , $this->_tpl_vars['userLocales'] )): ?> checked="checked"<?php endif; ?> /> <label for="userLocales-<?php echo ((is_array($_tmp=$this->_tpl_vars['localeKey'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
"><?php echo ((is_array($_tmp=$this->_tpl_vars['localeName'])) ? $this->_run_mod_handler('escape', true, $_tmp) : $this->_plugins['modifier']['escape'][0][0]->smartyEscape($_tmp)); ?>
</label><br />
    				<?php endforeach; endif; unset($_from); ?></td>
    			</tr>
    		<?php endif; ?>    	<?php endif; ?>


    <?php if (! $this->_tpl_vars['implicitAuth'] || $this->_tpl_vars['implicitAuth'] === @IMPLICIT_AUTH_OPTIONAL): ?>
    	<p><span class="formRequired"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.requiredField"), $this);?>
</span></p>

    <?php endif; ?>  </table>
    </form>
    <div id="privacyStatement">
    <?php if ($this->_tpl_vars['privacyStatement']): ?>
    	<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.register.privacyStatement"), $this);?>
</h3>
    	<p><?php echo ((is_array($_tmp=$this->_tpl_vars['privacyStatement'])) ? $this->_run_mod_handler('nl2br', true, $_tmp) : smarty_modifier_nl2br($_tmp)); ?>
</p>
    <?php endif; ?>
    </div>
  </div>
</div>






<script type="text/javascript"><?php echo '
$("#affDropDown").change(function(){
  $("#affiliation").val($("#affDropDown").val());
});
$("#orcid").focusin(function(){
  $("#orcidDesc").toggle();
})
$("#orcid").focusout(function(){
  $("#orcidDesc").toggle();
})
$("#registerForm").submit(function(){
  if($(\'.required\').val() !== \'\'){
    console.log(\'yo\');
    return false;
  }
})
'; ?>

</script>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>