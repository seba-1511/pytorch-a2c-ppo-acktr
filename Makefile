
.PHONY: all

dev:
	python main.py --env-name "CartPole-v0" --num-env-steps 10000


grid-gradient-noise-a2c-atari:
	for grad_noise in 0.0 0.05 0.1 0.2 0.4 0.8; do \
	    for seed in 1231 1232 1233 1234 1235; do \
		for env in "PongNoFrameskip-v4" "BreakoutNoFrameskip-v4" "SeaquestNoFrameskip-v4"; do \
		    python main.py \
			--algo a2c \
			--num-env-steps 10000000 \
			--experiment "grid-grad-noise" \
			--env-name $$env \
			--gradient_noise $$grad_noise \
			--seed $$seed; \
		done; \
	    done; \
	done


grid-gradient-noise-ppo-atari:
	for grad_noise in 0.0 0.05 0.1 0.2 0.4 0.8; do \
	    for seed in 1231 1232 1233 1234 1235; do \
		for env in "PongNoFrameskip-v4" "BreakoutNoFrameskip-v4" "SeaquestNoFrameskip-v4"; do \
		    python main.py \
			--algo ppo \
			--use-gae \
			--lr 2.5e-4 \
			--clip-param 0.1 \
			--value-loss-coef 0.5 \
			--num-steps 128 \
			--num-mini-batch 4 \
			--use-linear-lr-decay \
			--entropy-coef 0.01 \
			--num-env-steps 10000000 \
			--experiment "grid-grad-noise" \
			--env-name $$env \
			--gradient_noise $$grad_noise \
			--seed $$seed; \
		done; \
	    done; \
	done


grid-gradient-noise-a2c-control:
	for grad_noise in 0.0 0.05 0.1 0.2 0.4 0.8; do \
	    for seed in 1231 1232 1233 1234 1235; do \
		for env in "HalfCheetahBulletEnv-v0" "HopperBulletEnv-v0" "AntBulletEnv-v0"; do \
		    python main.py \
			--algo a2c \
			--num-env-steps 1000000 \
			--experiment "grid-grad-noise" \
			--env-name $$env \
			--gradient_noise $$grad_noise \
			--seed $$seed; \
		done; \
	    done; \
	done

grid-gradient-noise-ppo-control:
	for grad_noise in 0.0 0.05 0.1 0.2 0.4 0.8; do \
	    for seed in 1231 1232 1233 1234 1235; do \
		for env in "HalfCheetahBulletEnv-v0" "HopperBulletEnv-v0" "AntBulletEnv-v0"; do \
		    python main.py \
			--algo ppo \
			--ppo-epoch 10 \
			--use-gae \
			--lr 3e-4 \
			--value-loss-coef 0.5 \
			--num-steps 2048 \
			--num-mini-batch 32 \
			--gamma 0.99 \
			--tau 0.95 \
			--use-linear-lr-decay \
			--entropy-coef 0.0 \
			--num-env-steps 1000000 \
			--experiment "grid-grad-noise" \
			--env-name $$env \
			--gradient_noise $$grad_noise \
			--seed $$seed; \
		done; \
	    done; \
	done

