CONTAINER_IMAGE="lcvcl037/wp:titan27-v3"
CONTAINER_NAME="yy_deepseek"
echo "start to create docker"  


CONTAINER_CMD='export PATH="/usr/local/nvidia/toolkit:$PATH" && nerdctl run -d \
  --name '"${CONTAINER_NAME}"' \
  --gpus=all --ipc=host --network host \
  --device /dev/infiniband:/dev/infiniband \
  --cap-add=IPC_LOCK -v /usr/bin/ofed_info:/usr/bin/ofed_info --cap-add=SYS_RAWIO \
  -v /mnt/fast-disks/nfs/:/nfs \
  '"${CONTAINER_IMAGE}"' sleep infinity'

# 3. 用 eval 执行命令字符串（解析 && 和参数）
if eval "${CONTAINER_CMD}"; then
    echo "部署成功"  # 终端输出成功信息
else
    echo "部署失败"  # 终端输出失败信息（需查看错误原因）
fi
