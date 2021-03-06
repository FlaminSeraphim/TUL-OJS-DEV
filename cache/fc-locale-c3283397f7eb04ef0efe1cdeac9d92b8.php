<?php return array (
  'plugins.generic.xmlGalley.displayName' => 'XML Galley Plugin',
  'plugins.generic.xmlGalley.description' => 'This plugin generates XHTML galleys from an XML article using XSLT.',
  'plugins.generic.xmlGalley.manager.settings' => 'Settings',
  'plugins.generic.xmlGalley.settings.description' => '<p>With this plugin, article galleys will be automatically rendered from an uploaded XML source file, using a specific XSL stylesheet transformation.</p>',
  'plugins.generic.xmlGalley.settings.renderer' => 'XSLT Rendering Method',
  'plugins.generic.xmlGalley.settings.PHP5' => 'PHP 5.0.0+ with XSL functions (libxslt)',
  'plugins.generic.xmlGalley.settings.PHP4' => 'PHP 4.0.3+ with XSLT functions (Sablotron)',
  'plugins.generic.xmlGalley.settings.notAvailable' => 'Not Available',
  'plugins.generic.xmlGalley.settings.externalXSLT' => 'External command-line XSLT renderer (eg. Xalan)',
  'plugins.generic.xmlGalley.settings.externalXSLTDescription' => 'Enter the complete path to the XSLT renderer tool, with any required arguments.  Use %xsl to substitute the location of the XSL stylesheet file, and %xml to substitute the location of the XML source file; eg: <br /><pre>/usr/bin/java -jar ~/java/xalan.jar -HTML -IN %xml -XSL %xsl</pre>',
  'plugins.generic.xmlGalley.settings.externalXSLTTest' => 'Test XSLT',
  'plugins.generic.xmlGalley.settings.externalXSLTSuccess' => 'External XSLT test successful.',
  'plugins.generic.xmlGalley.settings.externalXSLTFailure' => 'External XSLT test failed.',
  'plugins.generic.xmlGalley.settings.externalXSLTRequired' => 'An external command-line XSLT processor must be specified.',
  'plugins.generic.xmlGalley.settings.stylesheet' => 'XSL Stylesheet',
  'plugins.generic.xmlGalley.settings.xslNLM' => '<a href="http://dtd.nlm.nih.gov/publishing/">NLM Journal Publishing DTD</a> &rarr; XHTML',
  'plugins.generic.xmlGalley.settings.xslFOP' => 'Enable rendering PDF galleys using XSL-FO (eg. FOP)',
  'plugins.generic.xmlGalley.settings.xslFOPDescription' => 'Enter the complete path to the FO processor, with any required arguments.  Use %fo to substitute the location of the XSL-FO file, and %pdf to substitute the location of the PDF file; eg: <br /><pre>/usr/sbin/fop -fo %fo -pdf %pdf</pre>',
  'plugins.generic.xmlGalley.settings.xslFOPRequired' => 'An external command-line FO processor must be specified.',
  'plugins.generic.xmlGalley.settings.customXSL' => 'Custom XSL stylesheet',
  'plugins.generic.xmlGalley.settings.customXSLRequired' => 'A custom XSL stylesheet file must be specified.',
  'plugins.generic.xmlGalley.settings.customXSLInvalid' => 'The uploaded XSL file was not valid. Please check the file and try again.',
); ?>