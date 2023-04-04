#!/bin/bash

system_list = $(ls | cut -d : -f 1)
system_description = ' ' read -r -a array <<< $(ls | cut -d : -f 2)

cont = 0
for system in $system_list; do
	mkdir $system
	touch $system/theme.xml
	cat << EOF > $system/theme.xml
	<theme>
	  <formatVersion>7</formatVersion>
	  <include>./../theme.xml</include>

	  <view name="basic, detailed, video, grid">
	    <text name="nameLabel" extra="true">
	      <text>${system_description[$cont]}</text>
	    </text>
	  </view>

	  <view name="system">
	    <text name="sys_line2" extra="true">
	      <text>${system_description[$cont]}</text>
      	  <pos>0.12 0.130</pos>
	    </text>
	    <text name="shortdescription" extra="true">
	      <text>AÑO · Descripcion</text>
	    </text>
	    <text name="longdescription" extra="true">
	      <text>Descripcion</text>
	    </text>
	  </view>
	</theme>
EOF
	cont=$((cont+1))
done
