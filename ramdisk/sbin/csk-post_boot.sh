#!/system/bin/sh
#
# Copyright - CrazyGamerGR
#     		 ________     __   ___
#    		/ ______|    |  | /  |
#    		|  |         |  |/  /
#   		|  |_____    |      \              
#   		\_______|    |__|\___|
#
BB=/sbin/busybox;

############################
# Custom Kernel Settings for CrazySuperKernel!
#
echo "[csk] Boot Script Started" | tee /dev/kmsg
stop mpdecision

############################
# MSM_MPDecision (Bricked) Hotplug Settings
#
echo 652800 > /sys/kernel/msm_mpdecision/conf/idle_freq
echo 1 > /sys/kernel/msm_mpdecision/conf/enabled

############################
# MSM Limiter
#
echo interactive > /sys/kernel/msm_limiter/scaling_governor_0
echo interactive > /sys/kernel/msm_limiter/scaling_governor_1
echo interactive > /sys/kernel/msm_limiter/scaling_governor_2
echo interactive > /sys/kernel/msm_limiter/scaling_governor_3
echo 300000 > /sys/kernel/msm_limiter/suspend_min_freq_0
echo 300000 > /sys/kernel/msm_limiter/suspend_min_freq_1
echo 300000 > /sys/kernel/msm_limiter/suspend_min_freq_2
echo 300000 > /sys/kernel/msm_limiter/suspend_min_freq_3
echo 2265600 > /sys/kernel/msm_limiter/resume_max_freq_0
echo 2265600 > /sys/kernel/msm_limiter/resume_max_freq_1
echo 2265600 > /sys/kernel/msm_limiter/resume_max_freq_2
echo 2265600 > /sys/kernel/msm_limiter/resume_max_freq_3
echo 1190400 > /sys/kernel/msm_limiter/suspend_max_freq
echo 1 > /sys/kernel/msm_limiter/freq_control

############################
# CPU Input Boost
#
echo 1190400 1497600 > /sys/kernel/cpu_input_boost/ib_freqs
echo 1400 > /sys/kernel/cpu_input_boost/ib_duration_ms
echo 1 > /sys/kernel/cpu_input_boost/enabled

############################
# MISC Tweaks
#
echo 0 > /sys/kernel/sched/gentle_fair_sleepers

############################
# Scheduler and Read Ahead
#
echo tripndroid > /sys/block/mmcblk0/queue/scheduler
echo 1024 > /sys/block/mmcblk0/bdi/read_ahead_kb

############################
# Adreno Idler
#
echo 2500 > /sys/module/adreno_idler/parameters/adreno_idler_idleworkload
echo 100 > /sys/module/adreno_idler/parameters/adreno_idler_idlewait
echo 50 > /sys/module/adreno_idler/parameters/adreno_idler_downdifferential
echo 0 > /sys/module/adreno_idler/parameters/adreno_idler_active

############################
# Simple GPU Algorithm
#
echo 2 > /sys/module/simple_gpu_algorithm/parameters/simple_laziness
echo 7000 > /sys/module/simple_gpu_algorithm/parameters/simple_ramp_threshold
echo 1 > /sys/module/simple_gpu_algorithm/parameters/simple_gpu_activate

############################
# Sound Control
#
echo 5 5 > /sys/kernel/sound_control_3/gpl_headphone_gain
echo 5 5 245 > /sys/kernel/sound_control_3/gpl_headphone_gain
echo 0 0 > /sys/kernel/sound_control_3/gpl_speaker_gain
echo 0 0 255 > /sys/kernel/sound_control_3/gpl_speaker_gain

############################
# Done!
#
echo "[csk] Exiting post-boot script" | tee /dev/kmsg
