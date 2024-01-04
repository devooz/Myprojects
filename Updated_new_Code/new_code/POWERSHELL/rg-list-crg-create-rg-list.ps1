$RG_NAME=read-host -prompt 'PLEASE PROVIDE THE RG NAME'
$RG_LOC=read-host -prompt 'PLEASE INPUT YOUR RG LOCATION NAME'
$VNET_NAME=read-host -prompt 'PLEASE INPUT YOUR VNET NAME'
$ADD_PRE="10.1.0.0/16"
$SUB_NAME="VM_Subnet"
$SUB_PRE="10.1.1.0/24"
$VM_NAME=read-host -prompt 'PLEASE INPUT YOUR VM NAME'
$IMAGE="UbuntuLTS"
$UID=read-host -prompt 'PLEASE INPUT YOUR VM ADMIN NAME'
$PWD=read-host -prompt 'PLEASE INPUT YOUR VM PASSWORD'
$SKU="Standard"
$VM_SIZE="Standard_B2s"
$SA_NAME=read-host -prompt 'PLEASE INPUT YOUR STORAGE ACCOUNT NAME'
$SA_SKU="Standard_LRS"

echo "############# LISTING OF RESOURCE GROUP ##############"
az group list -o table

echo "############# CREATING OF RESOURCE GROUP ##############"
az group create -n $RG_NAME -l $RG_LOC

echo "############# LISTING OF RESOURCE GROUP ##############"
az group list -o table

echo "############# LISTING OF VIRTUAL NETWORK  ##############"
az network vnet list -o table

echo "############# CREATING OF VIRTUAL NETWORK ##############"
az network vnet create -g $RG_NAME -n $VNET_NAME --address-prefix $ADD_PRE --subnet-name $SUB_NAME --subnet-prefix $SUB_PRE

echo "############# LISTING OF VIRTUAL NETWORK  ##############"
az network vnet list -o table

echo "############# LISTING OF VIRTUAL MACHINE  ##############"
az vm list -o table

echo "############# CREATING OF VIRTUAL MACHINE  ##############"
az vm create -g $RG_NAME -n $VM_NAME --image $IMAGE --admin-username $UID --admin-password $PWD --public-ip-sku $SKU --vnet-name $VNET_NAME --subnet $SUB_NAME --size $VM_SIZE

echo "############# LISTING OF VIRTUAL MACHINE  ##############"
az vm list -o table

echo "############# LISTING OF STORAGE ACCOUNT  ##############"
az storage account list -o table

echo "############# CREATING OF STORAGE ACCOUNT  ##############"
az storage account create -n $SA_NAME -g $RG_NAME -l $RG_LOC --sku $SA_SKU

echo "############# LISTING OF STORAGE ACCOUNT  ##############"
az storage account list -o table
