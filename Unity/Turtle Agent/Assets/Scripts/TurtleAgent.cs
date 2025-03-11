using Unity.MLAgents;
using Unity.MLAgents.Actuators;
using Unity.MLAgents.Sensors;
using UnityEngine;


public class TurtleAgent : Agent
{
    [SerializeField] private Transform _goal;
    [SerializeField] private float _moveSpeed = 1.5f;
    [SerializeField] private float _rotationSpeed = 180.0f;
    private Renderer _renderer;
    private int _currentEpisode = 0;
    private float _cumulativeReward = 0.0f;

    
    private void GoalReached()
    {
        // Large positive reward when the goal is reached.
        AddReward(1.0f);
        
        _cumulativeReward = GetCumulativeReward();
        EndEpisode();
    }


    private void MoveAgent(ActionSegment<int> act) {
        int action = act[0];

        switch (action) {
            case 1: // Move forward.
                transform.localPosition += transform.forward * _moveSpeed * Time.deltaTime;
                break;
            case 2: // Rotate left.
                transform.Rotate(0.0f, -_rotationSpeed * Time.deltaTime, 0.0f);
                break;
            case 3: // Rotate right.
                transform.Rotate(0.0f, _rotationSpeed * Time.deltaTime, 0.0f);
                break;
        };
    }

    private void SpawnObjects() {
        transform.localRotation = Quaternion.identity;
        transform.localPosition = new Vector3(0.0f, 0.15f, 0.0f);

        // Randomly place the goal.
        float randomAngle = Random.Range(0.0f, 360.0f);
        Vector3 randomDirection = Quaternion.Euler(0.0f, randomAngle, 0.0f) * Vector3.forward;

        // Random distance between 1.0 and 2.5.
        float randomDistance = Random.Range(1.0f, 2.5f);

        // Calculate the goal position.
        Vector3 goalPosition = transform.localPosition + randomDirection * randomDistance;

        // Apply the goal position.
        _goal.localPosition = new Vector3(goalPosition.x, 0.3f, goalPosition.z);
    }


    public override void Initialize()
    {
        Debug.Log("Initialize()");
        _renderer = GetComponent<Renderer>();
        _currentEpisode = 0;
        _cumulativeReward = 0.0f;
    }


    public override void OnEpisodeBegin()
    {
        Debug.Log("OnEpisodeBegin()");
        _currentEpisode++;
        _cumulativeReward = 0.0f;
        // Reset the TutrleAgent color to blue.
        _renderer.material.color = Color.blue;

        // Reposition the agent.
        SpawnObjects();
    }


    public override void CollectObservations(VectorSensor sensor)
    {
        Debug.Log("CollectObservations()");
        
        // The Goal's position normalized to the plane area.
        float goalPosX_normalized = _goal.localPosition.x / 5.0f;
        float goalPosZ_normalized = _goal.localPosition.z / 5.0f;

        // The Turtle's position normalized to the plane area.
        float turtlePosX_normalized = transform.localPosition.x / 5.0f;
        float turtlePosZ_normalized = transform.localPosition.z / 5.0f;

        // The Turtle's direction (on the Y Axis).
        float turtleRotation_normalized = ((transform.localRotation.eulerAngles.y / 360.0f) * 2.0f - 1.0f);

        sensor.AddObservation(goalPosX_normalized);
        sensor.AddObservation(goalPosZ_normalized);
        sensor.AddObservation(turtlePosX_normalized);
        sensor.AddObservation(turtlePosZ_normalized);
        sensor.AddObservation(turtleRotation_normalized);
    }


    public override void OnActionReceived(ActionBuffers actions)
    {
        Debug.Log("OnActionReceived()");

        // Move the agent using the action.
        MoveAgent(actions.DiscreteActions);

        // Penalty given each step to encourage the agent to finish the task quickly.
        AddReward(-2f / MaxStep);

        // Update the cumulative reward after adding the step penalty.
        _cumulativeReward = GetCumulativeReward();
    }


    public void OnTriggerEnter(Collider other)
    {
        Debug.Log("OnTriggerEnter()");

        if (other.gameObject.CompareTag("Goal")) 
        {
            GoalReached();
        };
    }


    private void OnCollisionEnter(Collision collision)
    {
        Debug.Log("OnCollisionEnter()");

        if (collision.gameObject.CompareTag("Wall"))
        {
            // Apply a small penalty when the agent hits a wall.
            AddReward(-0.05f);

            // Change the TurtleAgent color to red when it hits a wall.
            if (_renderer != null)
            {
                _renderer.material.color = Color.red;
            };
        };
    }


    private void OnCollisionStay(Collision collision)
    {
        Debug.Log("OnCollisionStay()");

        if (collision.gameObject.CompareTag("Wall"))
        {
            // Apply a small penalty while the agent is in contact with  a wall.
            AddReward(-0.01f * Time.fixedDeltaTime);
        };
    }

    private void OnCollisionExit(Collision collision)
    {
        Debug.Log("OnCollisionExit()");

        if (collision.gameObject.CompareTag("Wall"))
        {
            // Change the TurtleAgent color back to blue when it stops hitting a wall.
            if (_renderer != null)
            {
                _renderer.material.color = Color.blue;
            };
        };
    }
};
