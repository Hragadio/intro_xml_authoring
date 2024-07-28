<?xml version="1.0" encoding="UTF-8" ?>
<!--
   New Perspectives on XML, 3rd Edition
   Tutorial 5
   Case Problem 4

    Cairn Camping Store XSLT Style Sheet
    Author: Hannah Ragadio
    Date:   July 28,2024   

   Filename:         camping.xsl
   Supporting Files: 
-->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" doctype-public="-//W3C//DTD HTML 4.01 Transitional//EN"/>

    <!-- Main template -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Camping Store Orders</title>
            </head>
            <body>
                <!-- Store name as main heading -->
                <h1>Camping Store Orders</h1>

                <!-- Table for customers -->
                <xsl:apply-templates select="customers/customer">
                    <xsl:sort select="name" order="ascending"/>
                </xsl:apply-templates>
            </body>
        </html>
    </xsl:template>

    <!-- Template for each customer -->
    <xsl:template match="customer">
        <h2>Customer ID: <xsl:value-of select="@cid"/></h2>
        <p>
            <b>Name:</b> <xsl:value-of select="name"/><br/>
            <b>Address:</b> <xsl:value-of select="street"/>, <xsl:value-of select="city"/>, <xsl:value-of select="state"/> <xsl:value-of select="zip"/>
        </p>

        <!-- Table for orders -->
        <xsl:apply-templates select="orders/order">
            <xsl:sort select="@oid" order="descending"/>
        </xsl:apply-templates>
    </xsl:template>

    <!-- Template for each order -->
    <xsl:template match="order">
        <h3>Order ID: <xsl:value-of select="@oid"/> (Date: <xsl:value-of select="date"/>)</h3>
        <table border="1">
            <tr>
                <th>Item ID</th>
                <th>Description</th>
                <th>Quantity</th>
            </tr>
            <xsl:apply-templates select="item">
                <xsl:sort select="qty" data-type="number" order="descending"/>
                <xsl:sort select="@iid" order="ascending"/>
            </xsl:apply-templates>
        </table>
    </xsl:template>

    <!-- Template for each item -->
    <xsl:template match="item">
        <tr>
            <td><xsl:value-of select="@iid"/></td>
            <td><xsl:value-of select="description"/></td>
            <td><xsl:value-of select="qty"/></td>
        </tr>
    </xsl:template>
</xsl:stylesheet>