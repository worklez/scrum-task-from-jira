<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<html>
<head>
<title></title>
<style type="text/css">
.item {
	width: 10cm;
	height: 5cm;
	border: 1px solid #000;
	float: left;
	margin-right: .2cm;
	margin-bottom: .2cm;
}

.item-inner {
	padding: .5cm;
}

.item-sprint {
	float: left;
}

.item-project-name {
	float: right;
	text-decoration: underline;
}

.item-key {
	font-weight: bold;
	clear: both;
	margin-top: .7cm;
}

.item-name {
	clear: both;
	margin-top: .7cm;
}

.item-stories {
	margin-top: .7cm;
}

.item-story-box {
	width: .3cm;
	height: .3cm;
	border: 1px solid #000;
	float: left;
	margin-right: .1cm;
}

</style>
</head>
<body>
  <xsl:apply-templates/>
</body>
</html>
</xsl:template>

<!-- just to make them silent -->
<xsl:template match="title"></xsl:template>
<xsl:template match="link"></xsl:template>
<xsl:template match="description"></xsl:template>
<xsl:template match="language"></xsl:template>
<xsl:template match="build-info"></xsl:template>


<xsl:template name="story-boxes"> 
	<xsl:param name="i" /> 
	<xsl:param name="count" /> 
	<xsl:if test="$i &lt; $count"> 
		<div class="item-story-box"></div>
	</xsl:if> 

	<xsl:if test="$i &lt; $count"> 
		<xsl:call-template name="story-boxes"> 
			<xsl:with-param name="i"> 
				<xsl:value-of select="$i + 1"/> 
			</xsl:with-param> 
			<xsl:with-param name="count"> 
				<xsl:value-of select="$count"/> 
			</xsl:with-param> 
		</xsl:call-template> 
	</xsl:if> 
</xsl:template> 


<xsl:template match="item">
<div class="item">
<div class="item-inner">
<div class="item-sprint">Спринт 39</div>
<div class="item-project-name"><xsl:value-of select="project"/></div>
<div class="item-key"><xsl:value-of select="key"/></div>
<div class="item-name"><xsl:value-of select="summary"/></div>
<div class="item-stories">

<xsl:call-template name="story-boxes"> 
<xsl:with-param name="i">0</xsl:with-param> 
<xsl:with-param name="count">
<xsl:value-of select="customfields/*[customfieldname='Story Points']/customfieldvalues/customfieldvalue"/>
</xsl:with-param> 
</xsl:call-template>

</div>
</div>
</div>
</xsl:template>

</xsl:stylesheet>
