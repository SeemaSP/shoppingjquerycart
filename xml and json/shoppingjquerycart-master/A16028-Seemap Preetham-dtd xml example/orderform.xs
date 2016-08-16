<?xml version="1.0"?>
 <xs:schema xmlns:xs="http://www.w3.org/2001/XMLSchema" >

 <xs:element name="orderform" >
 <xs:complexType name="orderformtype">
 <xs:sequence>
   <xs:element ref="customer" minOccurs="0" maxOccurs="unbounded"/>
   <xs:element ref="product" minOccurs="0" maxOccurs="unbounded" />
  </xs:sequence>
 </xs:complexType>
 </xs:element>
 
 <xs:element name="customer">
	<xs:complexType name="customertype">
		<xs:sequence>
			<xs:element name="name" type="xs:string" />
			<xs:element name="address" type="xs:string" />
			<xs:element ref="tel" />   
		</xs:sequence> 
	</xs:complexType> 
 </xs:element>
 
 <xs:element name="product">
	<xs:complexType name="producttype">
		<xs:sequence>
			<xs:element name="product_name" type="xs:string" />
			<xs:element name="num" type="xs:string" />
		</xs:sequence> 
	</xs:complexType> 
 </xs:element>
 
 </xs:schema>

 <xs:element name="tel" type="teltype">
	<xs:complexType name="teltype">
		<xs:sequence>
			<xs:choice>
				<xs:element ref="portable" />
				<xs:element ref="home" />
			</xs:choice>
		</xs:sequence>	
	</xs:complexType>  
 </xs:element>
 
 <xs:simpleType name="portabletype">
	<xs:restriction base="xs:string">
		<xs:length value="10" />
	</xs:restriction>
 </xs:simpleType>
 
 <xs:element name="portable" type="portabletype" />
 <xs:element name="home" type="portabletype" />
 