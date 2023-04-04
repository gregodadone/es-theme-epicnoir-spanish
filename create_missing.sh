#!/bin/bash

system_list=$(cat missing_systems.txt | cut -d : -f 1)
readarray -t system_description <<< $(cat missing_systems.txt | awk -F': ' '{print$2}')
readarray -t short_description <<< $(cat missing_systems.txt | awk -F': ' '{print$3}')
readarray -t long_description <<< $(cat missing_systems.txt | awk -F': ' '{print$4}')
cont=0
for system in $system_list; do
    mkdir "$system"
    touch "$system"/theme.xml
    cat << EOF > "$system"/theme.xml
<theme>
  <formatVersion>7</formatVersion>
  <include>./../theme.xml</include>

  <view name="basic, detailed, video, grid">
    <text name="nameLabel" extra="true">
      <text>${system_description[cont]}</text>
    </text>
  </view>

  <view name="system">
    <text name="sys_line2" extra="true">
      <text>${system_description[cont]}</text>
      <pos>0.12 0.130</pos>
    </text>
    <text name="shortdescription" extra="true">
      <text>${short_description[cont]}</text>
    </text>
    <text name="longdescription" extra="true">
      <text>${long_description[cont]}</text>
    </text>
  </view>
</theme>
EOF
    cont=$((cont+1))
done
