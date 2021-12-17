<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html lang="en">
            <head>
                <meta charset="UTF-8" />
                <meta name="viewport" content="width=device-width, initial-scale=1" />
                <title><xsl:value-of select="tvision//@title"/></title>
                <link rel="stylesheet" href="tvision.css" />
            </head>
            <body>
                <div id="screen">
                    <xsl:apply-templates/>
                </div>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="tvision/window">
        <div class="window {@type}">
            <xsl:apply-templates/>
        </div>
    </xsl:template>
    
    <xsl:template match="window/title">
        <h1><xsl:value-of select="."/></h1>
    </xsl:template>
    
    <xsl:template match="window/p">
        <p><xsl:apply-templates/></p>
    </xsl:template>
    
    <xsl:template match="p/bold">
        <strong><xsl:value-of select="."/></strong>
    </xsl:template>
    
    <xsl:template match="p/wiki">
        <a href="https://en.wikipedia.org/wiki/{.}"><xsl:value-of select="."/></a>
    </xsl:template>
    
    <xsl:template match="window/form">
        <fieldset style="float:left"><legend><xsl:value-of select="@title"/></legend>
            <ul>
                <xsl:for-each select="widget">
                    <li>
                        <input type="{@type}" id="{@id}" name="{@name}" value="{@value}"/>
                        <label for="{@id}"><xsl:value-of select="."/></label>
                    </li>
                </xsl:for-each>
            </ul>
        </fieldset>
    </xsl:template>
    
    <xsl:template match="window/panel">
        <fieldset><legend><xsl:value-of select="@title"/></legend>
        <p><xsl:apply-templates/></p>
        </fieldset>
    </xsl:template>
    
    <xsl:template match="button">
        <button> <xsl:value-of select="."/> </button>
    </xsl:template>
    
</xsl:stylesheet>
