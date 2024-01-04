$RG=read-host -prompt 'PLEASE INPUT YOUR RG NAME'
$LOC=read-host -prompt 'PLEASE INPUT YOUR RG LOCATION NAME'
$VNET_NAME=read-host -prompt 'PLEASE INPUT YOUR VNET NAME'
$ADD_PREFIX="10.4.0.0/16"
$SUBNET_PREFIX="10.4.1.0/24"
$SUB_NAME="VM_Subnet"
$IMAGE="UbuntuLTS"
$UID=read-host -prompt 'PLEASE INPUT YOUR VM ADMIN NAME'
$PWD=read-host -prompt 'PLEASE INPUT YOUR VM PASSOWRD'
$VM_SIZE="Standard_DS2_v2"
$SKU="Standard"
$VM_NAME=read-host -prompt 'PLEASE INPUT YOUR VM NAME'
$SA_NAME="vritsolutismystorageacc"
$SA_SKU="Standard_LRS"

echo '########### RESOURCE GROUP LIST #############'
az group list -o table

echo '########### RESOURCE GROUP CREATE #############'
az group create --name $RG -l $LOC

echo '########### RESOURCE GROUP LIST #############'
az group list -o table

echo '########### VNET LIST #############'
az network vnet list -o table

echo '########### VNET CREATE #############'
az network vnet create -g $RG -n $VNET_NAME --address-prefix $ADD_PREFIX --subnet-name $SUB_NAME --subnet-prefix $SUBNET_PREFIX

echo '########### VNET LIST #############'
az network vnet list -o table

echo '########### VM LIST #############'
az vm list -o table

echo '########### VM CREATE #############'
az vm create -n $VM_NAME -g $RG --image $IMAGE --admin-username $UID --admin-password $PWD --vnet-name $VNET_NAME --subnet $SUB_NAME --size $VM_SIZE --public-ip-sku $SKU

echo '########### VM LIST #############'
az vm list -o table

echo '########### STORAGE ACCOUNT LIST #############'
az storage account list -o table

echo '########### STORAGE ACCOUNT CREATE #############'
az storage account create -n $SA_NAME -g $RG -l $LOC --sku $SA_SKU

echo '########### STORAGE ACCOUNT LIST #############'
az storage account list -o table